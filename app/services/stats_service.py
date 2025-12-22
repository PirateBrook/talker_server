from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, func, and_
from app.models.interaction import CharacterStats, CharacterRating, CharacterFollow, CharacterChatInteraction
from app.models.character import Character
from fastapi import HTTPException
import uuid

class StatsService:
    async def get_stats(self, db: AsyncSession, character_id: int) -> CharacterStats:
        result = await db.execute(select(CharacterStats).filter(CharacterStats.character_id == character_id))
        stats = result.scalars().first()
        if not stats:
            # Create if not exists (lazy init)
            # Check if character exists first
            char_res = await db.execute(select(Character).filter(Character.id == character_id))
            if not char_res.scalars().first():
                raise HTTPException(status_code=404, detail="Character not found")
            
            stats = CharacterStats(character_id=character_id)
            db.add(stats)
            await db.commit()
            await db.refresh(stats)
        return stats

    async def record_chat(self, db: AsyncSession, character_id: int, user_id: str):
        stats = await self.get_stats(db, character_id)
        
        # 1. Update turn count
        stats.chat_turn_count += 1
        
        # 2. Check unique user
        result = await db.execute(
            select(CharacterChatInteraction).filter(
                CharacterChatInteraction.character_id == character_id,
                CharacterChatInteraction.user_id == user_id
            )
        )
        interaction = result.scalars().first()
        
        if not interaction:
            interaction = CharacterChatInteraction(character_id=character_id, user_id=user_id)
            db.add(interaction)
            stats.chat_user_count += 1
        else:
            interaction.last_chat_at = func.now()
            db.add(interaction)
            
        db.add(stats)
        await db.commit()
        await db.refresh(stats)
        return stats

    async def rate_character(self, db: AsyncSession, character_id: int, user_id: str, rating: int):
        stats = await self.get_stats(db, character_id)
        
        # Check existing rating
        result = await db.execute(
            select(CharacterRating).filter(
                CharacterRating.character_id == character_id,
                CharacterRating.user_id == user_id
            )
        )
        existing_rating = result.scalars().first()
        
        if existing_rating:
            # Update rating: subtract old, add new
            stats.rating_sum = stats.rating_sum - existing_rating.rating + rating
            existing_rating.rating = rating
            db.add(existing_rating)
        else:
            # New rating
            new_rating = CharacterRating(character_id=character_id, user_id=user_id, rating=rating)
            db.add(new_rating)
            stats.rating_sum += rating
            stats.rating_count += 1
            
        # Recalculate average
        if stats.rating_count > 0:
            stats.average_rating = round(stats.rating_sum / stats.rating_count, 1)
        else:
            stats.average_rating = 0.0
            
        db.add(stats)
        await db.commit()
        await db.refresh(stats)
        return stats

    async def follow_character(self, db: AsyncSession, character_id: int, user_id: str) -> bool:
        """Returns True if followed, False if already following (idempotent-ish)"""
        stats = await self.get_stats(db, character_id)
        
        result = await db.execute(
            select(CharacterFollow).filter(
                CharacterFollow.character_id == character_id,
                CharacterFollow.user_id == user_id
            )
        )
        existing_follow = result.scalars().first()
        
        if existing_follow:
            return True # Already following
            
        follow = CharacterFollow(character_id=character_id, user_id=user_id)
        db.add(follow)
        
        stats.follower_count += 1
        db.add(stats)
        
        await db.commit()
        return True

    async def unfollow_character(self, db: AsyncSession, character_id: int, user_id: str) -> bool:
        stats = await self.get_stats(db, character_id)
        
        result = await db.execute(
            select(CharacterFollow).filter(
                CharacterFollow.character_id == character_id,
                CharacterFollow.user_id == user_id
            )
        )
        existing_follow = result.scalars().first()
        
        if not existing_follow:
            return False # Not following
            
        await db.delete(existing_follow)
        
        stats.follower_count = max(0, stats.follower_count - 1)
        db.add(stats)
        
        await db.commit()
        return True

    async def is_following(self, db: AsyncSession, character_id: int, user_id: str) -> bool:
        result = await db.execute(
            select(CharacterFollow).filter(
                CharacterFollow.character_id == character_id,
                CharacterFollow.user_id == user_id
            )
        )
        return result.scalars().first() is not None

stats_service = StatsService()
