from sqlalchemy import Column, String, DateTime, ForeignKey, Integer, Enum, Boolean
from sqlalchemy.dialects.postgresql import UUID, JSONB
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.core.database import Base
import uuid6
import enum

class SessionStatus(str, enum.Enum):
    ACTIVE = "active"
    ARCHIVED = "archived"
    DELETED = "deleted"

class ChatSession(Base):
    __tablename__ = "chat_sessions"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid6.uuid7, index=True)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False, index=True)
    character_id = Column(UUID(as_uuid=True), ForeignKey("characters.id"), nullable=False, index=True)
    
    title = Column(String, nullable=True)
    status = Column(String, default=SessionStatus.ACTIVE.value, nullable=False)
    
    # Social features
    is_pinned = Column(Boolean, default=False)
    last_message_preview = Column(String, nullable=True)
    unread_count = Column(Integer, default=0)
    
    # Statistics
    msg_count = Column(Integer, default=0)
    token_usage = Column(Integer, default=0)
    
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now(), server_default=func.now())

    # Relationships
    user = relationship("User", backref="chat_sessions")
    character = relationship("Character", backref="chat_sessions")
