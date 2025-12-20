from typing import Any, List
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.database import get_db
from app.schemas.character import Character, CharacterCreate, CharacterUpdate
from app.services.character_service import character_service

router = APIRouter()

@router.get("/", response_model=List[Character])
async def read_characters(
    db: AsyncSession = Depends(get_db),
    skip: int = 0,
    limit: int = 100,
) -> Any:
    """
    Retrieve characters.
    """
    characters = await character_service.get_multi(db, skip=skip, limit=limit)
    return characters

@router.post("/", response_model=Character)
async def create_character(
    *,
    db: AsyncSession = Depends(get_db),
    character_in: CharacterCreate,
) -> Any:
    """
    Create new character.
    """
    character = await character_service.create(db, obj_in=character_in)
    return character

@router.get("/{character_id}", response_model=Character)
async def read_character(
    *,
    db: AsyncSession = Depends(get_db),
    character_id: int,
) -> Any:
    """
    Get character by ID.
    """
    character = await character_service.get(db, character_id=character_id)
    if not character:
        raise HTTPException(status_code=404, detail="Character not found")
    return character

@router.patch("/{character_id}", response_model=Character)
async def update_character(
    *,
    db: AsyncSession = Depends(get_db),
    character_id: int,
    character_in: CharacterUpdate,
) -> Any:
    """
    Update a character.
    """
    character = await character_service.get(db, character_id=character_id)
    if not character:
        raise HTTPException(status_code=404, detail="Character not found")
    character = await character_service.update(db, db_obj=character, obj_in=character_in)
    return character

@router.delete("/{character_id}", response_model=Character)
async def delete_character(
    *,
    db: AsyncSession = Depends(get_db),
    character_id: int,
) -> Any:
    """
    Delete a character (soft delete).
    """
    character = await character_service.get(db, character_id=character_id)
    if not character:
        raise HTTPException(status_code=404, detail="Character not found")
    character = await character_service.remove(db, id=character_id)
    return character
