from fastapi import APIRouter
from app.api.v1.endpoints import chat, users, auth, characters, characters_stats, sessions, social, voices

api_router = APIRouter()
api_router.include_router(auth.router, prefix="/auth", tags=["auth"])
api_router.include_router(chat.router, prefix="/chat", tags=["chat"])
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(characters.router, prefix="/characters", tags=["characters"])
api_router.include_router(characters_stats.router, prefix="/characters", tags=["character-stats"])
api_router.include_router(sessions.router, prefix="/sessions", tags=["sessions"])
api_router.include_router(social.router, prefix="/social", tags=["social"])
api_router.include_router(voices.router, prefix="/voices", tags=["voices"])
