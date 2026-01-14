from enum import Enum
from typing import Optional, List
from pydantic import BaseModel

class VoiceFrequency(str, Enum):
    ALWAYS = "always"
    OCCASIONALLY = "occasionally"
    NEVER = "never"

class VoiceCategory(str, Enum):
    MALE = "male"
    FEMALE = "female"
    CHILD = "child"
    OTHER = "other"

class Voice(BaseModel):
    id: str
    name: str
    category: VoiceCategory
    description: Optional[str] = None
    preview_url: Optional[str] = None
    provider: str = "openai" # openai, azure, elevenlabs, etc.

class VoiceList(BaseModel):
    voices: List[Voice]
