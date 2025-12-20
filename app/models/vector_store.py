from pgvector.sqlalchemy import Vector
from sqlalchemy import Column, Integer, String, Text, Index
from sqlalchemy.orm import Mapped, mapped_column
from app.core.database import Base

class CharacterMemory(Base):
    __tablename__ = "character_memories"

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    character_id: Mapped[int] = mapped_column(Integer, index=True) # Add character_id
    content: Mapped[str] = mapped_column(Text) # 记忆文本
    # 1536 维向量 (适配 OpenAI Ada-002 或其他模型)
    embedding: Mapped[list[float]] = mapped_column(Vector(1536)) 

    # 建立 HNSW 索引以加速查询
    __table_args__ = (
        Index('my_index', 'embedding', postgresql_using='hnsw', postgresql_with={'m': 16, 'ef_construction': 64}, postgresql_ops={'embedding': 'vector_l2_ops'}),
    )
