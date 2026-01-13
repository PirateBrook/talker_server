from typing import Optional, Dict, Any
from pydantic import BaseModel, Field
import uuid
from datetime import datetime
from app.schemas.character import Character

class ChatSessionSettings(BaseModel):
    is_pinned: bool = False
    is_blocked: bool = False
    allow_stickers: bool = True
    allow_nudge: bool = True
    allow_action_desc: bool = True
    max_reply_tokens: int = 100
    context_window_size: int = 10
    auto_summary_enabled: bool = False
    auto_summary_threshold: int = 20

class ChatSessionBase(BaseModel):
    title: Optional[str] = None
    status: str = "active"
    is_pinned: bool = False
    
    # Settings & Summary
    summary: Optional[str] = None
    summary_prompt: Optional[str] = None
    background_image: Optional[str] = None
    settings: ChatSessionSettings = Field(default_factory=ChatSessionSettings)

class ChatSessionCreate(ChatSessionBase):
    character_id: uuid.UUID

class ChatSessionUpdate(BaseModel):
    title: Optional[str] = None
    status: Optional[str] = None
    is_pinned: Optional[bool] = None
    summary: Optional[str] = None
    summary_prompt: Optional[str] = None
    background_image: Optional[str] = None
    settings: Optional[ChatSessionSettings] = None

class ChatSession(ChatSessionBase):
    id: uuid.UUID
    user_id: uuid.UUID
    character_id: uuid.UUID
    character: Optional[Character] = None
    
    last_message_preview: Optional[str] = None
    unread_count: int = 0
    msg_count: int = 0
    token_usage: int = 0
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True
