from typing import List, Optional, Tuple
import uuid
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, desc, asc, and_, or_, func
from sqlalchemy.orm import selectinload

from app.models.character import Character
from app.models.interaction import CharacterFollow, CharacterChatInteraction
from app.models.chat_session import ChatSession, SessionStatus
from app.schemas.social import FriendItem, MessageSessionItem

class SocialService:
    async def get_friends(
        self, 
        db: AsyncSession, 
        user_id: uuid.UUID, 
        skip: int = 0, 
        limit: int = 20,
        search: Optional[str] = None,
        sort_by: str = "recent"  # recent | name
    ) -> List[FriendItem]:
        
        # Base query: Characters followed by user
        # We also want last_chat_at from CharacterChatInteraction
        stmt = (
            select(Character, CharacterChatInteraction.last_chat_at)
            .join(CharacterFollow, Character.id == CharacterFollow.character_id)
            .outerjoin(CharacterChatInteraction, and_(
                Character.id == CharacterChatInteraction.character_id,
                CharacterChatInteraction.user_id == user_id
            ))
            .filter(CharacterFollow.user_id == user_id)
            .options(
                selectinload(Character.tags),
                selectinload(Character.dialogue_samples)
            )
        )
        
        # Search
        if search:
            stmt = stmt.filter(Character.name.ilike(f"%{search}%"))
            
        # Sort
        if sort_by == "recent":
            stmt = stmt.order_by(CharacterChatInteraction.last_chat_at.desc().nulls_last())
        elif sort_by == "name":
            stmt = stmt.order_by(Character.name.asc())
            
        # Pagination
        stmt = stmt.offset(skip).limit(limit)
        
        result = await db.execute(stmt)
        rows = result.all()
        
        friends = []
        for row in rows:
            character, last_chat_at = row
            friends.append(FriendItem(
                character=character,
                last_interaction_at=last_chat_at
            ))
            
        return friends

    async def get_message_sessions(
        self,
        db: AsyncSession,
        user_id: uuid.UUID,
        skip: int = 0,
        limit: int = 20
    ) -> List[MessageSessionItem]:
        
        stmt = (
            select(ChatSession)
            .options(
                selectinload(ChatSession.character).options(
                    selectinload(Character.tags),
                    selectinload(Character.dialogue_samples)
                )
            )
            .filter(
                ChatSession.user_id == user_id,
                ChatSession.status == SessionStatus.ACTIVE.value
            )
            # Sort by pinned (True first), then updated_at desc
            .order_by(ChatSession.is_pinned.desc(), ChatSession.updated_at.desc())
            .offset(skip)
            .limit(limit)
        )
        
        result = await db.execute(stmt)
        sessions = result.scalars().all()
        
        items = []
        for session in sessions:
            items.append(MessageSessionItem(
                session_id=session.id,
                character=session.character,
                last_message_preview=session.last_message_preview,
                unread_count=session.unread_count,
                updated_at=session.updated_at,
                is_pinned=session.is_pinned
            ))
            
        return items

    async def pin_session(
        self,
        db: AsyncSession,
        user_id: uuid.UUID,
        session_id: uuid.UUID,
        is_pinned: bool
    ) -> Optional[ChatSession]:
        
        stmt = select(ChatSession).filter(
            ChatSession.id == session_id,
            ChatSession.user_id == user_id
        )
        result = await db.execute(stmt)
        session = result.scalars().first()
        
        if session:
            session.is_pinned = is_pinned
            db.add(session)
            await db.commit()
            await db.refresh(session)
            
        return session

    async def update_session_preview(
        self,
        db: AsyncSession,
        session_id: uuid.UUID,
        preview: str,
        increment_unread: bool = False
    ):
        stmt = select(ChatSession).filter(ChatSession.id == session_id)
        result = await db.execute(stmt)
        session = result.scalars().first()
        
        if session:
            session.last_message_preview = preview
            session.updated_at = func.now()
            if increment_unread:
                session.unread_count += 1
            else:
                session.unread_count = 0 # Or handle logic elsewhere
                
            db.add(session)
            await db.commit()

social_service = SocialService()
