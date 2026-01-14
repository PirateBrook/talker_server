from typing import List, Any
from fastapi import APIRouter, Depends
from app.schemas.voice import VoiceList
from app.services.voice_service import voice_service

router = APIRouter()

@router.get("/", response_model=VoiceList)
async def get_available_voices() -> Any:
    """
    Get list of available TTS voices.
    """
    voices = voice_service.get_all_voices()
    return {"voices": voices}
