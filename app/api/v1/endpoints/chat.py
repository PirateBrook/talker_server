from fastapi import APIRouter, WebSocket, WebSocketDisconnect, Query, Depends, status, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
import jwt
from jwt.exceptions import PyJWTError
from pydantic import ValidationError
from typing import Any, List

from app.core.config import settings
from app.core import security
from app.core.database import get_db, mongo_db
from app.services.user_service import user_service
from app.services.chat_stream import chat_manager
from app.services.session_service import session_service
from app.schemas.token import TokenPayload
from app.schemas.message_record import MessageRecord
from app.api import deps

router = APIRouter()

import uuid

async def get_current_user_ws(
    websocket: WebSocket,
    token: str = Query(...),
    db: AsyncSession = Depends(get_db)
):
    try:
        payload = jwt.decode(
            token, settings.SECRET_KEY, algorithms=[security.ALGORITHM]
        )
        token_data = TokenPayload(sub=str(payload.get("sub")))
    except (PyJWTError, ValidationError):
        await websocket.close(code=status.WS_1008_POLICY_VIOLATION)
        return None
    
    if not token_data.sub:
        await websocket.close(code=status.WS_1008_POLICY_VIOLATION)
        return None

    try:
        user_uuid = uuid.UUID(token_data.sub)
    except ValueError:
         await websocket.close(code=status.WS_1008_POLICY_VIOLATION)
         return None

    user = await user_service.get(db, user_id=user_uuid)
    if not user:
        await websocket.close(code=status.WS_1008_POLICY_VIOLATION)
        return None
        
    return user

@router.websocket("/ws")
async def websocket_endpoint(
    websocket: WebSocket,
    current_user = Depends(get_current_user_ws),
    db: AsyncSession = Depends(get_db)
):
    if current_user is None:
        return # Connection closed in dependency

    await chat_manager.handle_websocket(
        websocket=websocket,
        user_id=current_user.id,
        db=db
    )

@router.get("/history", response_model=List[MessageRecord], status_code=200)
async def get_chat_history(
    character_id: uuid.UUID,
    limit: int = 50,
    db: AsyncSession = Depends(get_db),
    current_user: Any = Depends(deps.get_current_user)
) -> Any:
    """
    Get chat history for the current active session (Implicit Session).
    """
    # 1. Resolve implicit session_id
    active_session = await session_service.get_active_session(db, current_user.id, character_id)
    session_id = str(active_session.id)
    
    # 2. Query MongoDB for this session
    cursor = mongo_db["chat_logs"].find({"session_id": session_id}).sort("created_at", -1).limit(limit)
    logs = await cursor.to_list(length=limit)
    
    # 3. Return reversed (chronological order) if needed, or frontend handles it.
    # Usually history API returns newest first or oldest first.
    # Let's return chronological (oldest first) which is standard for chat UI to append.
    return sorted(logs, key=lambda x: x["created_at"])
