import uuid
from typing import List, Optional
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, delete
from langchain_openai import OpenAIEmbeddings
import asyncio

from app.core.config import settings
from app.models.vector_store import CharacterMemory
from app.schemas.memory import MemoryCreate, MemoryUpdate

class MemoryService:
    def __init__(self):
        self.embeddings = OpenAIEmbeddings(
            openai_api_key=settings.OPENAI_API_KEY,
            openai_api_base=settings.OPENAI_API_BASE_URL,
            model="text-embedding-3-small"
        )

    async def add_memory(
        self, 
        db: AsyncSession, 
        character_id: uuid.UUID, 
        content: str, 
        user_id: Optional[uuid.UUID] = None,
        source_message_id: Optional[uuid.UUID] = None,
        is_manual: bool = False
    ) -> CharacterMemory:
        # Generate embedding
        embedding = await asyncio.to_thread(self.embeddings.embed_query, content)
        
        memory = CharacterMemory(
            character_id=character_id,
            user_id=user_id,
            content=content,
            embedding=embedding,
            source_message_id=source_message_id,
            is_manual=is_manual
        )
        db.add(memory)
        await db.commit()
        await db.refresh(memory)
        return memory

    async def get_memories(
        self, 
        db: AsyncSession, 
        character_id: uuid.UUID, 
        user_id: Optional[uuid.UUID] = None,
        limit: int = 50, 
        skip: int = 0
    ) -> List[CharacterMemory]:
        stmt = select(CharacterMemory).filter(
            CharacterMemory.character_id == character_id
        )
        
        if user_id:
            stmt = stmt.filter(CharacterMemory.user_id == user_id)
            
        stmt = stmt.order_by(CharacterMemory.id.desc()).offset(skip).limit(limit)
        result = await db.execute(stmt)
        return result.scalars().all()

    async def delete_memory(self, db: AsyncSession, memory_id: int) -> bool:
        stmt = select(CharacterMemory).filter(CharacterMemory.id == memory_id)
        result = await db.execute(stmt)
        memory = result.scalars().first()
        if memory:
            await db.delete(memory)
            await db.commit()
            return True
        return False

    async def update_memory(self, db: AsyncSession, memory_id: int, obj_in: MemoryUpdate) -> Optional[CharacterMemory]:
        stmt = select(CharacterMemory).filter(CharacterMemory.id == memory_id)
        result = await db.execute(stmt)
        memory = result.scalars().first()
        if not memory:
            return None
            
        if obj_in.content is not None:
            memory.content = obj_in.content
            # Re-embed
            memory.embedding = await asyncio.to_thread(self.embeddings.embed_query, obj_in.content)
            
        if obj_in.is_manual is not None:
            memory.is_manual = obj_in.is_manual
            
        await db.commit()
        await db.refresh(memory)
        return memory

    async def search_memories(
        self, 
        db: AsyncSession, 
        character_id: uuid.UUID, 
        query: str, 
        user_id: Optional[uuid.UUID] = None,
        limit: int = 5
    ) -> List[CharacterMemory]:
        embedding = await asyncio.to_thread(self.embeddings.embed_query, query)
        
        stmt = select(CharacterMemory).filter(
            CharacterMemory.character_id == character_id
        )
        
        if user_id:
            stmt = stmt.filter(CharacterMemory.user_id == user_id)
            
        stmt = stmt.order_by(
            CharacterMemory.embedding.l2_distance(embedding)
        ).limit(limit)
        
        result = await db.execute(stmt)
        return result.scalars().all()

memory_service = MemoryService()
