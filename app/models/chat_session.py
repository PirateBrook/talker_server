from sqlalchemy import Column, String, DateTime, ForeignKey, Integer, Enum, Boolean, Text
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
    
    # New Settings & Summary
    summary = Column(Text, nullable=True) # 长期记忆摘要
    summary_prompt = Column(Text, nullable=True) # 自定义总结提示词
    background_image = Column(String, nullable=True) # 聊天背景
    settings = Column(JSONB, default={
        "is_pinned": False,
        "is_blocked": False,
        "allow_stickers": True,
        "allow_nudge": True,
        "allow_action_desc": True,
        "max_reply_tokens": 100,
        "context_window_size": 10,
        "auto_summary_enabled": False,
        "auto_summary_threshold": 20
    })

    # Statistics
    msg_count = Column(Integer, default=0)
    token_usage = Column(Integer, default=0)
    
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now(), server_default=func.now())

    # Relationships
    user = relationship("User", backref="chat_sessions")
    character = relationship("Character", backref="chat_sessions")
