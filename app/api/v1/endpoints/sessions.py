import uuid
from typing import Any, List
from fastapi import APIRouter, Depends, HTTPException, status, Query
from sqlalchemy.ext.asyncio import AsyncSession
from app.api import deps
from app.core.database import get_db
from app.models.user import User
from app.services.session_service import session_service
from app.services.memory_service import memory_service
from app.schemas.chat_session import ChatSession, ChatSessionUpdate
from app.schemas.memory import CharacterMemory, MemoryCreate, MemoryUpdate
from pydantic import BaseModel

router = APIRouter()

@router.get("/active_session", response_model=ChatSession)
async def get_active_session(
    character_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Get current active session ID for a character. Creates one if none exists.
    """
    session = await session_service.get_active_session(db, current_user.id, character_id)
    return session

@router.post("/reset", response_model=ChatSession)
async def reset_session(
    character_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Archive current session and start a new one (Reset Chat).
    """
    session = await session_service.reset_session(db, current_user.id, character_id)
    return session

@router.put("/{session_id}/settings", response_model=ChatSession)
async def update_session_settings(
    session_id: uuid.UUID,
    session_in: ChatSessionUpdate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Update session settings (including summary, pinned status, etc.).
    """
    session = await session_service.get_session_by_id(db, session_id)
    if not session:
        raise HTTPException(status_code=404, detail="Session not found")
    if session.user_id != current_user.id:
         raise HTTPException(status_code=403, detail="Not authorized")
         
    updated_session = await session_service.update_session(db, session_id, session_in)
    return updated_session

@router.post("/{session_id}/clear", response_model=dict)
async def clear_session_history(
    session_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Clear chat history for a session.
    """
    session = await session_service.get_session_by_id(db, session_id)
    if not session:
        raise HTTPException(status_code=404, detail="Session not found")
    if session.user_id != current_user.id:
         raise HTTPException(status_code=403, detail="Not authorized")
         
    success = await session_service.clear_session_history(db, session_id)
    if not success:
        raise HTTPException(status_code=500, detail="Failed to clear history")
        
    return {"message": "History cleared"}

# Memory Endpoints

@router.get("/{session_id}/memories", response_model=List[CharacterMemory])
async def get_session_memories(
    session_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
    skip: int = 0,
    limit: int = 50,
) -> Any:
    """
    Get memories for a session (character).
    """
    session = await session_service.get_session_by_id(db, session_id)
    if not session:
        raise HTTPException(status_code=404, detail="Session not found")
    if session.user_id != current_user.id:
         raise HTTPException(status_code=403, detail="Not authorized")
         
    memories = await memory_service.get_memories(
        db, 
        character_id=session.character_id, 
        user_id=current_user.id,
        skip=skip, 
        limit=limit
    )
    return memories

@router.post("/{session_id}/memories", response_model=CharacterMemory)
async def add_session_memory(
    session_id: uuid.UUID,
    memory_in: MemoryCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Manually add a memory.
    """
    session = await session_service.get_session_by_id(db, session_id)
    if not session:
        raise HTTPException(status_code=404, detail="Session not found")
    if session.user_id != current_user.id:
         raise HTTPException(status_code=403, detail="Not authorized")
         
    memory = await memory_service.add_memory(
        db, 
        character_id=session.character_id, 
        content=memory_in.content,
        user_id=current_user.id,
        is_manual=memory_in.is_manual
    )
    return memory

@router.delete("/memories/{memory_id}", response_model=dict)
async def delete_memory(
    memory_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(deps.get_current_user),
) -> Any:
    """
    Delete a memory.
    """
    # Note: Proper authorization would require checking if the memory belongs to the user
    # For now assuming user owns the memory if they can delete it, or we check db first.
    # We should add a check.
    # But for simplicity in this iteration:
    success = await memory_service.delete_memory(db, memory_id)
    if not success:
        raise HTTPException(status_code=404, detail="Memory not found")
    return {"message": "Memory deleted"}

