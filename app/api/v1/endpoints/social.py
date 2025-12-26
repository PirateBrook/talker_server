from typing import List, Any, Optional
import uuid
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.database import get_db
from app.api import deps
from app.models.user import User
from app.schemas.social import FriendItem, MessageSessionItem, PinSessionRequest
from app.services.social_service import social_service

router = APIRouter()

@router.get("/friends", response_model=List[FriendItem])
async def get_friends(
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
    skip: int = 0,
    limit: int = 20,
    search: Optional[str] = None,
    sort_by: str = Query("recent", regex="^(recent|name)$")
) -> Any:
    """
    Get friend list (followed characters).
    """
    return await social_service.get_friends(
        db, 
        current_user.id, 
        skip=skip, 
        limit=limit, 
        search=search, 
        sort_by=sort_by
    )

@router.get("/sessions", response_model=List[MessageSessionItem])
async def get_message_sessions(
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
    skip: int = 0,
    limit: int = 20,
) -> Any:
    """
    Get message sessions list.
    """
    return await social_service.get_message_sessions(
        db, 
        current_user.id, 
        skip=skip, 
        limit=limit
    )

@router.post("/sessions/{session_id}/pin", response_model=Any)
async def pin_session(
    session_id: uuid.UUID,
    body: PinSessionRequest,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Pin or unpin a session.
    """
    session = await social_service.pin_session(
        db, 
        current_user.id, 
        session_id, 
        body.is_pinned
    )
    if not session:
        raise HTTPException(status_code=404, detail="Session not found")
    
    return {"success": True, "is_pinned": session.is_pinned}
