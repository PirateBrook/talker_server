import uuid
from typing import Optional, List, Dict, Any
from datetime import datetime
from pydantic import BaseModel, Field

# Tag Schemas
class TagBase(BaseModel):
    name: str

class TagCreate(TagBase):
    pass

class Tag(TagBase):
    id: int
    class Config:
        from_attributes = True

# DialogueSample Schemas
class DialogueSampleBase(BaseModel):
    input_text: str
    output_text: str

class DialogueSampleCreate(DialogueSampleBase):
    pass

class DialogueSample(DialogueSampleBase):
    id: int
    character_id: Optional[uuid.UUID] = None
    class Config:
        from_attributes = True

# Character Schemas
class CharacterBase(BaseModel):
    name: str
    description: Optional[str] = None
    personality: Optional[str] = None
    backstory: Optional[str] = None
    voice_style: Optional[str] = None
    interaction_preference: Optional[str] = None
    
    # New Fields
    gender: Optional[str] = None
    avatar: Optional[str] = None
    expression_style: Optional[str] = None
    catchphrases: Optional[List[str]] = []
    prompt_template: Optional[str] = None
    
    custom_attributes: Optional[Dict[str, Any]] = Field(default_factory=dict)

class CharacterCreate(CharacterBase):
    tags: Optional[List[str]] = [] # List of tag names
    dialogue_samples: Optional[List[DialogueSampleCreate]] = []

class CharacterUpdate(BaseModel):
    name: Optional[str] = None
    description: Optional[str] = None
    personality: Optional[str] = None
    backstory: Optional[str] = None
    voice_style: Optional[str] = None
    interaction_preference: Optional[str] = None
    custom_attributes: Optional[Dict[str, Any]] = None
    tags: Optional[List[str]] = None
    
    # New Fields Updates
    gender: Optional[str] = None
    avatar: Optional[str] = None
    expression_style: Optional[str] = None
    catchphrases: Optional[List[str]] = None
    prompt_template: Optional[str] = None
    
class Character(CharacterBase):
    id: uuid.UUID
    is_active: bool
    created_at: datetime
    updated_at: datetime
    tags: List[Tag] = []
    dialogue_samples: List[DialogueSample] = []
    
    class Config:
        from_attributes = True
