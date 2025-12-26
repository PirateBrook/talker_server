import pytest
from httpx import AsyncClient
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.config import settings
from app.models.character import Character
from app.models.chat_session import ChatSession, SessionStatus
from tests.conftest import create_test_character

@pytest.mark.asyncio
async def test_social_features(
    client: AsyncClient,
    db: AsyncSession,
    normal_user_token_headers: dict,
):
    headers = normal_user_token_headers
    
    # 1. Create a character
    char = await create_test_character(db)
    char_id = str(char.id)
    
    # 2. Follow character
    res = await client.post(
        f"{settings.API_V1_STR}/characters/{char_id}/follow",
        headers=headers
    )
    assert res.status_code == 200
    
    # 3. Simulate chat interaction (to update last_chat_at)
    res = await client.post(
        f"{settings.API_V1_STR}/characters/{char_id}/chat-interaction",
        headers=headers
    )
    assert res.status_code == 200
    
    # 4. Get active session (created by chat-interaction or explicitly)
    # The chat-interaction endpoint might not create a session record in the way SocialService expects (it updates CharacterChatInteraction)
    # Let's explicitly create a session via session endpoint
    res = await client.get(
        f"{settings.API_V1_STR}/chat/active_session?character_id={char_id}",
        headers=headers
    )
    assert res.status_code == 200
    session_id = res.json()["session_id"]
    
    # 5. Test Friend List
    res = await client.get(
        f"{settings.API_V1_STR}/social/friends",
        headers=headers
    )
    assert res.status_code == 200
    friends = res.json()
    assert len(friends) >= 1
    assert friends[0]["character"]["id"] == char_id
    assert friends[0]["last_interaction_at"] is not None
    
    # 6. Test Message List
    res = await client.get(
        f"{settings.API_V1_STR}/social/sessions",
        headers=headers
    )
    assert res.status_code == 200
    sessions = res.json()
    assert len(sessions) >= 1
    assert sessions[0]["session_id"] == session_id
    assert sessions[0]["is_pinned"] == False
    
    # 7. Test Pin Session
    res = await client.post(
        f"{settings.API_V1_STR}/social/sessions/{session_id}/pin",
        json={"is_pinned": True},
        headers=headers
    )
    assert res.status_code == 200
    assert res.json()["is_pinned"] == True
    
    # Verify pinned in list
    res = await client.get(
        f"{settings.API_V1_STR}/social/sessions",
        headers=headers
    )
    sessions = res.json()
    assert sessions[0]["is_pinned"] == True
    
    # Unpin
    res = await client.post(
        f"{settings.API_V1_STR}/social/sessions/{session_id}/pin",
        json={"is_pinned": False},
        headers=headers
    )
    assert res.status_code == 200
    assert res.json()["is_pinned"] == False
