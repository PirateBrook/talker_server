from sqlalchemy import Column, Integer, String, Boolean, Text, DateTime, ForeignKey, Table, JSON
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.core.database import Base

# Association table for Character-Tag
character_tags = Table(
    'character_tags',
    Base.metadata,
    Column('character_id', Integer, ForeignKey('characters.id'), primary_key=True),
    Column('tag_id', Integer, ForeignKey('tags.id'), primary_key=True)
)

class Tag(Base):
    __tablename__ = "tags"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, unique=True, index=True)

class DialogueSample(Base):
    __tablename__ = "dialogue_samples"
    id = Column(Integer, primary_key=True, index=True)
    character_id = Column(Integer, ForeignKey('characters.id'))
    input_text = Column(Text)
    output_text = Column(Text)
    
    character = relationship("Character", back_populates="dialogue_samples")

class Character(Base):
    __tablename__ = "characters"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True, nullable=False)
    description = Column(String, nullable=True) # Short bio
    
    # Traits
    personality = Column(Text, nullable=True) # Detailed personality description
    backstory = Column(Text, nullable=True)
    voice_style = Column(String, nullable=True)
    interaction_preference = Column(String, nullable=True)
    
    # Extension
    custom_attributes = Column(JSON, default={})
    
    # Meta
    is_active = Column(Boolean, default=True) # For soft delete
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now(), server_default=func.now())
    
    # Relationships
    tags = relationship("Tag", secondary=character_tags, backref="characters")
    dialogue_samples = relationship("DialogueSample", back_populates="character", cascade="all, delete-orphan")
