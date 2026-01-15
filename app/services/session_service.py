import uuid
from typing import Optional
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, update
from sqlalchemy.orm import selectinload
from app.models.chat_session import ChatSession, SessionStatus
from app.core.database import redis_client
import uuid6

from app.schemas.chat_session import ChatSessionSettings, ChatSessionUpdate

class SessionService:
    async def get_active_session(self, db: AsyncSession, user_id: uuid.UUID, character_id: uuid.UUID) -> ChatSession:
        # 1. Try get from Redis
        redis_key = f"active_session:{user_id}:{character_id}"
        session_id_str = await redis_client.get(redis_key)
        
        if session_id_str:
            try:
                session_id = uuid.UUID(session_id_str)
                # Verify existence in DB
                result = await db.execute(
                    select(ChatSession)
                    .options(selectinload(ChatSession.character))
                    .filter(ChatSession.id == session_id)
                )
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
        
        # Reload with relationships
        result = await db.execute(
            select(ChatSession)
            .options(selectinload(ChatSession.character))
            .filter(ChatSession.id == new_session.id)
        )
        return result.scalars().first()

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
        result = await db.execute(
            select(ChatSession)
            .options(selectinload(ChatSession.character))
            .filter(ChatSession.id == session_id)
        )
        return result.scalars().first()
    
    async def update_session(self, db: AsyncSession, session_id: uuid.UUID, obj_in: ChatSessionUpdate) -> Optional[ChatSession]:
        session = await self.get_session_by_id(db, session_id)
        if not session:
            return None
            
        update_data = obj_in.model_dump(exclude_unset=True)
        
        # Handle settings specifically if it's a model
        if "settings" in update_data and update_data["settings"] is not None:
             new_settings = update_data["settings"]
             current_settings = dict(session.settings) if session.settings else {}
             
             # Merge
             current_settings.update(new_settings)
             session.settings = current_settings
             
             del update_data["settings"]

        for field, value in update_data.items():
            if hasattr(session, field):
                setattr(session, field, value)
                
        db.add(session)
        await db.commit()
        await db.refresh(session)
        return session

    async def clear_session_history(self, db: AsyncSession, session_id: uuid.UUID) -> bool:
        # Clear summary
        session = await self.get_session_by_id(db, session_id)
        if session:
            session.summary = None
            session.msg_count = 0
            session.token_usage = 0
            db.add(session)
            await db.commit()
            
            # TODO: Clear MongoDB messages if implemented
            # await mongo_db.messages.delete_many({"session_id": str(session_id)})
            
            return True
        return False

session_service = SessionService()
