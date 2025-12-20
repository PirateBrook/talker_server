import pytest
from httpx import AsyncClient
from app.core.config import settings

@pytest.mark.asyncio
async def test_character_stats_flow(client: AsyncClient):
    # 1. Create a character
    char_data = {"name": "Stats NPC", "description": "For stats testing"}
    create_res = await client.post(f"{settings.API_V1_STR}/characters/", json=char_data)
    char_id = create_res.json()["id"]
    
    # 2. Login as a user (register first)
    email = "stats_user@example.com"
    password = "password123"
    await client.post(
        f"{settings.API_V1_STR}/auth/register",
        json={"email": email, "password": password, "full_name": "Stats User"}
    )
    login_res = await client.post(
        f"{settings.API_V1_STR}/auth/login/access-token",
        data={"username": email, "password": password}
    )
    token = login_res.json()["access_token"]
    headers = {"Authorization": f"Bearer {token}"}
    
    # 3. Get initial stats (should be empty/zeros)
    stats_res = await client.get(f"{settings.API_V1_STR}/characters/{char_id}/stats")
    assert stats_res.status_code == 200
    stats = stats_res.json()
    assert stats["chat_user_count"] == 0
    assert stats["chat_turn_count"] == 0
    assert stats["follower_count"] == 0
    assert stats["average_rating"] == 0.0
    
    # 4. Record chat interactions
    # First interaction
    await client.post(f"{settings.API_V1_STR}/characters/{char_id}/chat-interaction", headers=headers)
    stats = (await client.get(f"{settings.API_V1_STR}/characters/{char_id}/stats")).json()
    assert stats["chat_user_count"] == 1
    assert stats["chat_turn_count"] == 1
    
    # Second interaction (same user) -> user count same, turn count increases
    await client.post(f"{settings.API_V1_STR}/characters/{char_id}/chat-interaction", headers=headers)
    stats = (await client.get(f"{settings.API_V1_STR}/characters/{char_id}/stats")).json()
    assert stats["chat_user_count"] == 1
    assert stats["chat_turn_count"] == 2
    
    # 5. Rate character
    rate_res = await client.post(
        f"{settings.API_V1_STR}/characters/{char_id}/rate",
        headers=headers,
        json={"rating": 5}
    )
    assert rate_res.status_code == 200
    stats = rate_res.json()
    assert stats["average_rating"] == 5.0
    assert stats["rating_count"] == 1
    
    # Update rating
    rate_res = await client.post(
        f"{settings.API_V1_STR}/characters/{char_id}/rate",
        headers=headers,
        json={"rating": 3}
    )
    stats = rate_res.json()
    assert stats["average_rating"] == 3.0 # Replaced
    assert stats["rating_count"] == 1
    
    # 6. Follow character
    follow_res = await client.post(f"{settings.API_V1_STR}/characters/{char_id}/follow", headers=headers)
    assert follow_res.status_code == 200
    assert follow_res.json()["is_following"] == True
    assert follow_res.json()["follower_count"] == 1
    
    # Check stats again
    stats = (await client.get(f"{settings.API_V1_STR}/characters/{char_id}/stats")).json()
    assert stats["follower_count"] == 1
    
    # Unfollow
    unfollow_res = await client.delete(f"{settings.API_V1_STR}/characters/{char_id}/follow", headers=headers)
    assert unfollow_res.status_code == 200
    assert unfollow_res.json()["is_following"] == False
    assert unfollow_res.json()["follower_count"] == 0

@pytest.mark.asyncio
async def test_multiple_users_stats(client: AsyncClient):
    # Setup character
    char_res = await client.post(f"{settings.API_V1_STR}/characters/", json={"name": "Multi User NPC"})
    char_id = char_res.json()["id"]
    
    # User 1
    await client.post(f"{settings.API_V1_STR}/auth/register", json={"email": "u1@e.com", "password": "p", "full_name": "U1"})
    token1 = (await client.post(f"{settings.API_V1_STR}/auth/login/access-token", data={"username": "u1@e.com", "password": "p"})).json()["access_token"]
    h1 = {"Authorization": f"Bearer {token1}"}
    
    # User 2
    await client.post(f"{settings.API_V1_STR}/auth/register", json={"email": "u2@e.com", "password": "p", "full_name": "U2"})
    token2 = (await client.post(f"{settings.API_V1_STR}/auth/login/access-token", data={"username": "u2@e.com", "password": "p"})).json()["access_token"]
    h2 = {"Authorization": f"Bearer {token2}"}
    
    # Interactions
    await client.post(f"{settings.API_V1_STR}/characters/{char_id}/chat-interaction", headers=h1)
    await client.post(f"{settings.API_V1_STR}/characters/{char_id}/chat-interaction", headers=h2)
    
    stats = (await client.get(f"{settings.API_V1_STR}/characters/{char_id}/stats")).json()
    assert stats["chat_user_count"] == 2
    assert stats["chat_turn_count"] == 2
    
    # Ratings: U1=5, U2=1 -> Avg=3
    await client.post(f"{settings.API_V1_STR}/characters/{char_id}/rate", headers=h1, json={"rating": 5})
    await client.post(f"{settings.API_V1_STR}/characters/{char_id}/rate", headers=h2, json={"rating": 1})
    
    stats = (await client.get(f"{settings.API_V1_STR}/characters/{char_id}/stats")).json()
    assert stats["average_rating"] == 3.0
    assert stats["rating_count"] == 2
