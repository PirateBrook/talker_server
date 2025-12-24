from pydantic import BaseModel, Field
from datetime import datetime
from typing import Optional, Dict, Any
import uuid

from app.schemas.common import MessageContentMixin, MessageContentType

class MessageRecord(MessageContentMixin):
    id: str = Field(default_factory=lambda: str(uuid.uuid7()))
    session_id: str
    user_id: str
    character_id: uuid.UUID
    role: str  # "user" | "ai" | "system"
    # content, content_type, metadata inherited from MessageContentMixin
    action_type: Optional[str] = None
    created_at: datetime = Field(default_factory=datetime.now)
