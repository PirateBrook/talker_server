from typing import List
from app.schemas.voice import Voice, VoiceCategory, VoiceList

# Mock data for now
AVAILABLE_VOICES = [
    Voice(id="alloy", name="温软亲切", category=VoiceCategory.FEMALE, description="温软亲切", provider="openai"),
    Voice(id="echo", name="清冷低沉", category=VoiceCategory.MALE, description="清冷低沉", provider="openai"),
    Voice(id="fable", name="绵软文静", category=VoiceCategory.FEMALE, description="绵软文静", provider="openai"),
    Voice(id="onyx", name="透亮疏离", category=VoiceCategory.MALE, description="透亮疏离", provider="openai"),
    Voice(id="nova", name="温柔平静", category=VoiceCategory.FEMALE, description="温柔平静", provider="openai"),
    Voice(id="shimmer", name="冷静忧郁", category=VoiceCategory.FEMALE, description="冷静忧郁", provider="openai"),
]

class VoiceService:
    def get_all_voices(self) -> List[Voice]:
        return AVAILABLE_VOICES

    def get_voice_by_id(self, voice_id: str) -> Voice:
        for voice in AVAILABLE_VOICES:
            if voice.id == voice_id:
                return voice
        return None

voice_service = VoiceService()
