import uuid
from typing import Optional
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, update
from app.models.chat_session import ChatSession, SessionStatus
from app.core.database import redis_client
import uuid6

class SessionService:
    async def get_active_session(self, db: AsyncSession, user_id: uuid.UUID, character_id: uuid.UUID) -> ChatSession:
        # 1. Try get from Redis
        redis_key = f"active_session:{user_id}:{character_id}"
        session_id_str = await redis_client.get(redis_key)
        
        if session_id_str:
            try:
                session_id = uuid.UUID(session_id_str)
                # Verify existence in DB
                result = await db.execute(select(ChatSession).filter(ChatSession.id == session_id))
                session = result.scalars().first()
                if session and session.status == SessionStatus.ACTIVE:
                    return session
            except ValueError:
                pass
        
        # 2. If not found or invalid, create new
        return await self.create_session(db, user_id, character_id)

    async def create_session(self, db: AsyncSession, user_id: uuid.UUID, character_id: uuid.UUID) -> ChatSession:
        # Archive any existing active sessions for this pair (optional safety)
        # For now, just create new
        
        new_session = ChatSession(
            user_id=user_id,
            character_id=character_id,
            status=SessionStatus.ACTIVE
        )
        db.add(new_session)
        await db.commit()
        await db.refresh(new_session)
        
        # Update Redis
        redis_key = f"active_session:{user_id}:{character_id}"
        await redis_client.set(redis_key, str(new_session.id))
        
        return new_session

    async def reset_session(self, db: AsyncSession, user_id: uuid.UUID, character_id: uuid.UUID) -> ChatSession:
        # 1. Find current session
        redis_key = f"active_session:{user_id}:{character_id}"
        session_id_str = await redis_client.get(redis_key)
        
        if session_id_str:
            session_id = uuid.UUID(session_id_str)
            result = await db.execute(select(ChatSession).filter(ChatSession.id == session_id))
            current_session = result.scalars().first()
            
            if current_session:
                current_session.status = SessionStatus.ARCHIVED
                db.add(current_session)
        
        # 2. Create new session
        return await self.create_session(db, user_id, character_id)

    async def get_session_by_id(self, db: AsyncSession, session_id: uuid.UUID) -> Optional[ChatSession]:
        result = await db.execute(select(ChatSession).filter(ChatSession.id == session_id))
        return result.scalars().first()

session_service = SessionService()
