from typing import List, Optional
from datetime import datetime
from pydantic import BaseModel
import uuid
from app.schemas.character import Character

class FriendItem(BaseModel):
    character: Character
    last_interaction_at: Optional[datetime] = None
    
    class Config:
        from_attributes = True

class MessageSessionItem(BaseModel):
    session_id: uuid.UUID
    character: Character
    last_message_preview: Optional[str] = None
    unread_count: int = 0
    updated_at: datetime
    is_pinned: bool = False
    
    class Config:
        from_attributes = True

class PinSessionRequest(BaseModel):
    is_pinned: bool
