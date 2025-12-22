from fastapi import APIRouter, WebSocket, WebSocketDisconnect, Query, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession
import jwt
from jwt.exceptions import PyJWTError
from pydantic import ValidationError

from app.core.config import settings
from app.core import security
from app.core.database import get_db
from app.services.user_service import user_service
from app.services.chat_stream import chat_manager
from app.schemas.token import TokenPayload

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
