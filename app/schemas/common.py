from enum import Enum
from typing import Optional, Dict, Any
from pydantic import BaseModel, Field

class MessageContentType(str, Enum):
    TEXT = "text"
    IMAGE = "image"
    AUDIO = "audio"
    VIDEO = "video"

class MessageContentMixin(BaseModel):
    content: str
    content_type: MessageContentType = MessageContentType.TEXT
    metadata: Optional[Dict[str, Any]] = None
