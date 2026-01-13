from pgvector.sqlalchemy import Vector
from sqlalchemy import Column, Integer, String, Text, Index, ForeignKey, Boolean
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import Mapped, mapped_column
from app.core.database import Base

class CharacterMemory(Base):
    __tablename__ = "character_memories"

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    character_id: Mapped[UUID] = mapped_column(UUID(as_uuid=True), index=True) # Add character_id
    user_id: Mapped[UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("users.id"), index=True, nullable=True) # 关联用户
    source_message_id: Mapped[UUID] = mapped_column(UUID(as_uuid=True), nullable=True) # 来源消息ID
    is_manual: Mapped[bool] = mapped_column(Boolean, default=False) # 是否手动添加
    content: Mapped[str] = mapped_column(Text) # 记忆文本
    # 1536 维向量 (适配 OpenAI Ada-002 或其他模型)
    embedding: Mapped[list[float]] = mapped_column(Vector(1536)) 

    # 建立 HNSW 索引以加速查询
    __table_args__ = (
        Index('my_index', 'embedding', postgresql_using='hnsw', postgresql_with={'m': 16, 'ef_construction': 64}, postgresql_ops={'embedding': 'vector_l2_ops'}),
    )
