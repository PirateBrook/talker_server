from fastapi import APIRouter
from app.api.v1.endpoints import chat, users, auth, characters

api_router = APIRouter()
api_router.include_router(auth.router, prefix="/auth", tags=["auth"])
api_router.include_router(chat.router, prefix="/chat", tags=["chat"])
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(characters.router, prefix="/characters", tags=["characters"])
