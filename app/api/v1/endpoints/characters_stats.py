from typing import Any
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.database import get_db
from app.api.deps import get_current_user
from app.models.user import User
from app.schemas.stats import CharacterStats, RateCharacterRequest, FollowCharacterResponse
from app.services.stats_service import stats_service

router = APIRouter()

@router.get("/{character_id}/stats", response_model=CharacterStats)
async def get_character_stats(
    *,
    db: AsyncSession = Depends(get_db),
    character_id: int,
) -> Any:
    """
    Get statistics for a character.
    """
    return await stats_service.get_stats(db, character_id)

@router.post("/{character_id}/rate", response_model=CharacterStats)
async def rate_character(
    *,
    db: AsyncSession = Depends(get_db),
    character_id: int,
    rating_in: RateCharacterRequest,
    current_user: User = Depends(get_current_user),
) -> Any:
    """
    Rate a character (1-5).
    """
    return await stats_service.rate_character(
        db, character_id, current_user.id, rating_in.rating
    )

@router.post("/{character_id}/follow", response_model=FollowCharacterResponse)
async def follow_character(
    *,
    db: AsyncSession = Depends(get_db),
    character_id: int,
    current_user: User = Depends(get_current_user),
) -> Any:
    """
    Follow a character.
    """
    await stats_service.follow_character(db, character_id, current_user.id)
    stats = await stats_service.get_stats(db, character_id)
    return {
        "success": True,
        "is_following": True,
        "follower_count": stats.follower_count
    }

@router.delete("/{character_id}/follow", response_model=FollowCharacterResponse)
async def unfollow_character(
    *,
    db: AsyncSession = Depends(get_db),
    character_id: int,
    current_user: User = Depends(get_current_user),
) -> Any:
    """
    Unfollow a character.
    """
    await stats_service.unfollow_character(db, character_id, current_user.id)
    stats = await stats_service.get_stats(db, character_id)
    return {
        "success": True,
        "is_following": False,
        "follower_count": stats.follower_count
    }

# Internal/Test endpoint to simulate chat interaction (since actual chat is placeholder)
@router.post("/{character_id}/chat-interaction", response_model=CharacterStats)
async def record_chat_interaction(
    *,
    db: AsyncSession = Depends(get_db),
    character_id: int,
    current_user: User = Depends(get_current_user),
) -> Any:
    """
    Record a chat interaction (Simulates a chat turn).
    """
    return await stats_service.record_chat(db, character_id, current_user.id)
