from sqlalchemy import Column, Integer, Float, ForeignKey, DateTime, UniqueConstraint
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.core.database import Base

class CharacterStats(Base):
    __tablename__ = "character_stats"

    character_id = Column(Integer, ForeignKey("characters.id"), primary_key=True)
    
    chat_user_count = Column(Integer, default=0)
    chat_turn_count = Column(Integer, default=0)
    follower_count = Column(Integer, default=0)
    
    # Rating info
    rating_sum = Column(Integer, default=0)
    rating_count = Column(Integer, default=0)
    average_rating = Column(Float, default=0.0)
    
    updated_at = Column(DateTime(timezone=True), onupdate=func.now(), server_default=func.now())
    
    # Relationships
    character = relationship("Character", backref="stats")

class CharacterRating(Base):
    __tablename__ = "character_ratings"
    
    id = Column(Integer, primary_key=True, index=True)
    character_id = Column(Integer, ForeignKey("characters.id"), index=True)
    user_id = Column(Integer, ForeignKey("users.id"), index=True)
    rating = Column(Integer, nullable=False) # 1-5
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    
    __table_args__ = (
        UniqueConstraint('character_id', 'user_id', name='uq_character_rating_user'),
    )

class CharacterFollow(Base):
    __tablename__ = "character_follows"
    
    id = Column(Integer, primary_key=True, index=True)
    character_id = Column(Integer, ForeignKey("characters.id"), index=True)
    user_id = Column(Integer, ForeignKey("users.id"), index=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    
    __table_args__ = (
        UniqueConstraint('character_id', 'user_id', name='uq_character_follow_user'),
    )

class CharacterChatInteraction(Base):
    """Tracks if a user has chatted with a character to count distinct users"""
    __tablename__ = "character_chat_interactions"
    
    id = Column(Integer, primary_key=True, index=True)
    character_id = Column(Integer, ForeignKey("characters.id"), index=True)
    user_id = Column(Integer, ForeignKey("users.id"), index=True)
    last_chat_at = Column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now())
    
    __table_args__ = (
        UniqueConstraint('character_id', 'user_id', name='uq_character_chat_user'),
    )
