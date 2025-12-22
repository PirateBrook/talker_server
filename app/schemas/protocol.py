import uuid
from enum import Enum
from typing import Optional, Union, Dict, Any, Literal
from pydantic import BaseModel, Field
from datetime import datetime

# --- Client Messages (Client -> Server) ---

class MessageType(str, Enum):
    CHAT = "chat"
    ACTION = "action"

class BaseClientMessage(BaseModel):
    type: MessageType
    timestamp: float = Field(default_factory=lambda: datetime.now().timestamp())

class ChatMessage(BaseClientMessage):
    type: Literal[MessageType.CHAT] = MessageType.CHAT
    character_id: uuid.UUID
    content: str

class ActionMessage(BaseClientMessage):
    type: Literal[MessageType.ACTION] = MessageType.ACTION
    character_id: uuid.UUID
    action_id: str
    target_id: Optional[str] = None
    payload: Optional[Dict[str, Any]] = None

ClientMessage = Union[ChatMessage, ActionMessage]

# --- Server Messages (Server -> Client) ---

class ServerMessageType(str, Enum):
    AI_STATUS = "ai_status"
    AI_CHUNK = "ai_chunk"
    AI_END = "ai_end"
    GAME_EVENT = "game_event"
    ERROR = "error"

class BaseServerMessage(BaseModel):
    type: ServerMessageType
    character_id: Optional[uuid.UUID] = None # Server response should indicate which character it relates to
    timestamp: float = Field(default_factory=lambda: datetime.now().timestamp())

class AIStatusMessage(BaseServerMessage):
    type: Literal[ServerMessageType.AI_STATUS] = ServerMessageType.AI_STATUS
    status: str  # e.g., "thinking", "searching_memory"

class AIChunkMessage(BaseServerMessage):
    type: Literal[ServerMessageType.AI_CHUNK] = ServerMessageType.AI_CHUNK
    content: str
    seq: int

class AIEndMessage(BaseServerMessage):
    type: Literal[ServerMessageType.AI_END] = ServerMessageType.AI_END
    full_content: Optional[str] = None

class GameEventMessage(BaseServerMessage):
    type: Literal[ServerMessageType.GAME_EVENT] = ServerMessageType.GAME_EVENT
    event_type: str
    payload: Dict[str, Any]

class ErrorMessage(BaseServerMessage):
    type: Literal[ServerMessageType.ERROR] = ServerMessageType.ERROR
    code: str
    message: str

ServerMessage = Union[
    AIStatusMessage,
    AIChunkMessage,
    AIEndMessage,
    GameEventMessage,
    ErrorMessage
]
