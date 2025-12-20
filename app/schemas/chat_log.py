from pydantic import BaseModel, Field
from datetime import datetime
from typing import Optional, Dict, Any

class ChatLog(BaseModel):
    session_id: str
    user_id: int
    character_id: int
    role: str  # "user" | "ai" | "system"
    content: str
    action_type: Optional[str] = None
    created_at: datetime = Field(default_factory=datetime.now)
    metadata: Optional[Dict[str, Any]] = None
