from pydantic import BaseModel, Field
from typing import Optional

class CharacterStatsBase(BaseModel):
    chat_user_count: int = 0
    chat_turn_count: int = 0
    follower_count: int = 0
    average_rating: float = 0.0
    rating_count: int = 0

class CharacterStats(CharacterStatsBase):
    character_id: int
    class Config:
        from_attributes = True

class RateCharacterRequest(BaseModel):
    rating: int = Field(..., ge=1, le=5)

class FollowCharacterResponse(BaseModel):
    success: bool
    is_following: bool
    follower_count: int
