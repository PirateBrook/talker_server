from sqlalchemy import Column, Integer, String, Boolean, Text, DateTime, ForeignKey, Table, JSON
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.core.database import Base
import uuid6

# Association table for Character-Tag
character_tags = Table(
    'character_tags',
    Base.metadata,
    Column('character_id', UUID(as_uuid=True), ForeignKey('characters.id'), primary_key=True),
    Column('tag_id', Integer, ForeignKey('tags.id'), primary_key=True)
)

class Tag(Base):
    __tablename__ = "tags"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, unique=True, index=True)

class DialogueSample(Base):
    __tablename__ = "dialogue_samples"
    id = Column(Integer, primary_key=True, index=True)
    character_id = Column(UUID(as_uuid=True), ForeignKey('characters.id'))
    input_text = Column(Text)
    output_text = Column(Text)
    
    character = relationship("Character", back_populates="dialogue_samples")

class Character(Base):
    __tablename__ = "characters"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid6.uuid7, index=True)
    name = Column(String, index=True, nullable=False)
    description = Column(String, nullable=True) # Short bio
    
    # Traits
    personality = Column(Text, nullable=True) # Detailed personality description
    backstory = Column(Text, nullable=True)
    voice_style = Column(String, nullable=True)
    interaction_preference = Column(String, nullable=True)
    
    # New Fields
    gender = Column(String, nullable=True) # MALE, FEMALE, OTHER
    avatar = Column(String, nullable=True)
    expression_style = Column(Text, nullable=True) # 表达风格
    catchphrases = Column(JSON, default=[]) # 习惯用语
    prompt_template = Column(Text, nullable=True) # 自定义 Prompt 模板
    default_voice_id = Column(String, nullable=True) # 默认音色 ID

    # Extension
    custom_attributes = Column(JSON, default={})
    
    # Meta
    is_active = Column(Boolean, default=True) # For soft delete
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now(), server_default=func.now())
    
    # Relationships
    tags = relationship("Tag", secondary=character_tags, backref="characters")
    dialogue_samples = relationship("DialogueSample", back_populates="character", cascade="all, delete-orphan")
