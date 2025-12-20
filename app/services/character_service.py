from typing import List, Optional, Any
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, update, delete
from sqlalchemy.orm import selectinload

from app.models.character import Character, Tag, DialogueSample
from app.schemas.character import CharacterCreate, CharacterUpdate

class TraitStrategy:
    """Strategy interface for trait calculation"""
    def calculate(self, character_data: dict) -> dict:
        return character_data

class DefaultTraitStrategy(TraitStrategy):
    def calculate(self, character_data: dict) -> dict:
        # Placeholder logic: e.g. analyze description to suggest interaction_preference
        # For now, just pass through
        return character_data

class CharacterService:
    def __init__(self, trait_strategy: TraitStrategy = DefaultTraitStrategy()):
        self.trait_strategy = trait_strategy

    async def get(self, db: AsyncSession, character_id: int) -> Optional[Character]:
        result = await db.execute(
            select(Character)
            .options(selectinload(Character.tags), selectinload(Character.dialogue_samples))
            .filter(Character.id == character_id, Character.is_active == True)
        )
        return result.scalars().first()

    async def get_multi(
        self, db: AsyncSession, *, skip: int = 0, limit: int = 100
    ) -> List[Character]:
        result = await db.execute(
            select(Character)
            .options(selectinload(Character.tags), selectinload(Character.dialogue_samples))
            .filter(Character.is_active == True)
            .offset(skip)
            .limit(limit)
        )
        return result.scalars().all()

    async def create(self, db: AsyncSession, *, obj_in: CharacterCreate) -> Character:
        obj_in_data = obj_in.model_dump()
        
        # Apply strategy
        obj_in_data = self.trait_strategy.calculate(obj_in_data)
        
        tags_names = obj_in_data.pop("tags", [])
        dialogue_samples_data = obj_in_data.pop("dialogue_samples", [])
        
        db_obj = Character(**obj_in_data)
        db.add(db_obj)
        
        # Handle tags
        if tags_names:
            for tag_name in tags_names:
                result = await db.execute(select(Tag).filter(Tag.name == tag_name))
                tag = result.scalars().first()
                if not tag:
                    tag = Tag(name=tag_name)
                    db.add(tag)
                db_obj.tags.append(tag)
        
        # Handle dialogue samples
        if dialogue_samples_data:
            for ds in dialogue_samples_data:
                # ds is a dict here because of model_dump()
                db_ds = DialogueSample(**ds)
                db_obj.dialogue_samples.append(db_ds)

        await db.commit()
        await db.refresh(db_obj)
        # Re-fetch to load relationships
        return await self.get(db, db_obj.id)

    async def update(
        self, db: AsyncSession, *, db_obj: Character, obj_in: CharacterUpdate | dict
    ) -> Character:
        # Check if obj_in is a dict or Pydantic model
        if isinstance(obj_in, dict):
            update_data = obj_in
        else:
            update_data = obj_in.model_dump(exclude_unset=True)
            
        tags_names = update_data.pop("tags", None)
        
        # Update fields
        for field, value in update_data.items():
            if hasattr(db_obj, field):
                setattr(db_obj, field, value)
        
        # Update tags if provided
        if tags_names is not None:
            # Clear existing tags association (not deleting tags themselves)
            db_obj.tags.clear()
            for tag_name in tags_names:
                result = await db.execute(select(Tag).filter(Tag.name == tag_name))
                tag = result.scalars().first()
                if not tag:
                    tag = Tag(name=tag_name)
                    db.add(tag)
                db_obj.tags.append(tag)
                
        db.add(db_obj)
        await db.commit()
        await db.refresh(db_obj)
        return await self.get(db, db_obj.id)

    async def remove(self, db: AsyncSession, *, id: int) -> Optional[Character]:
        # Soft delete
        obj = await self.get(db, id)
        if obj:
            obj.is_active = False
            db.add(obj)
            await db.commit()
            await db.refresh(obj)
        return obj

character_service = CharacterService()
