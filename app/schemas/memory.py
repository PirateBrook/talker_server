import uuid
from typing import Optional
from datetime import datetime
from pydantic import BaseModel

class MemoryBase(BaseModel):
    content: str
    is_manual: bool = False

class MemoryCreate(MemoryBase):
    pass

class MemoryUpdate(BaseModel):
    content: Optional[str] = None
    is_manual: Optional[bool] = None

class CharacterMemory(MemoryBase):
    id: int
    character_id: uuid.UUID
    user_id: Optional[uuid.UUID] = None
    source_message_id: Optional[uuid.UUID] = None
    
    # We generally don't expose the embedding vector
    
    class Config:
        from_attributes = True
