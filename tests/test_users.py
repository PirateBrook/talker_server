import pytest
from httpx import AsyncClient
from app.core.config import settings

@pytest.mark.asyncio
async def test_create_user_anonymous(client: AsyncClient):
    response = await client.post(f"{settings.API_V1_STR}/auth/login/anonymous")
    assert response.status_code == 200
    data = response.json()
    assert "access_token" in data
    assert data["token_type"] == "bearer"

@pytest.mark.asyncio
async def test_register_and_login_user(client: AsyncClient):
    email = "test_user@example.com"
    password = "password123"
    full_name = "Test User"

    # Register
    response = await client.post(
        f"{settings.API_V1_STR}/auth/register",
        json={"email": email, "password": password, "full_name": full_name}
    )
    # 200 OK or 400 if already exists. If 400, we proceed to login.
    if response.status_code == 200:
        data = response.json()
        assert data["email"] == email
        assert "id" in data
    else:
        assert response.status_code == 400
        assert "already exists" in response.json()["detail"]

    # Login
    login_data = {
        "username": email,
        "password": password
    }
    response = await client.post(f"{settings.API_V1_STR}/auth/login/access-token", data=login_data)
    assert response.status_code == 200
    tokens = response.json()
    assert "access_token" in tokens
    assert tokens["token_type"] == "bearer"

    # Get User Me
    headers = {"Authorization": f"Bearer {tokens['access_token']}"}
    response = await client.get(f"{settings.API_V1_STR}/users/me", headers=headers)
    assert response.status_code == 200
    user_data = response.json()
    assert user_data["email"] == email
    assert user_data["full_name"] == full_name

@pytest.mark.asyncio
async def test_login_wrong_password(client: AsyncClient):
    login_data = {
        "username": "test_user@example.com",
        "password": "wrongpassword"
    }
    response = await client.post(f"{settings.API_V1_STR}/auth/login/access-token", data=login_data)
    assert response.status_code == 400
    assert "Incorrect email or password" in response.json()["detail"]

@pytest.mark.asyncio
async def test_get_me_unauthorized(client: AsyncClient):
    response = await client.get(f"{settings.API_V1_STR}/users/me")
    assert response.status_code == 401
