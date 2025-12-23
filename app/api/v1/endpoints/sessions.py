import uuid
from typing import Any
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.api import deps
from app.core.database import get_db
from app.models.user import User
from app.services.session_service import session_service
from pydantic import BaseModel

router = APIRouter()

class SessionResponse(BaseModel):
    session_id: uuid.UUID
    status: str

@router.get("/active_session", response_model=SessionResponse)
async def get_active_session(
    character_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Get current active session ID for a character. Creates one if none exists.
    """
    session = await session_service.get_active_session(db, current_user.id, character_id)
    return {"session_id": session.id, "status": session.status}

@router.post("/reset", response_model=SessionResponse)
async def reset_session(
    character_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Archive current session and start a new one (Reset Chat).
    """
    session = await session_service.reset_session(db, current_user.id, character_id)
    return {"session_id": session.id, "status": session.status}
