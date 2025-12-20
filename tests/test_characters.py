import pytest
from httpx import AsyncClient
from app.core.config import settings

@pytest.mark.asyncio
async def test_create_character(client: AsyncClient):
    data = {
        "name": "Test NPC",
        "description": "A test NPC",
        "personality": "Friendly",
        "tags": ["hero", "mage"],
        "dialogue_samples": [
            {"input_text": "Hi", "output_text": "Hello there!"}
        ]
    }
    response = await client.post(f"{settings.API_V1_STR}/characters/", json=data)
    assert response.status_code == 200
    content = response.json()
    assert content["name"] == data["name"]
    assert len(content["tags"]) == 2
    assert len(content["dialogue_samples"]) == 1
    assert content["dialogue_samples"][0]["output_text"] == "Hello there!"

@pytest.mark.asyncio
async def test_read_characters(client: AsyncClient):
    response = await client.get(f"{settings.API_V1_STR}/characters/")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

@pytest.mark.asyncio
async def test_update_character(client: AsyncClient):
    # First create
    data = {"name": "To Update", "tags": ["old"]}
    create_res = await client.post(f"{settings.API_V1_STR}/characters/", json=data)
    char_id = create_res.json()["id"]
    
    # Update
    update_data = {"name": "Updated Name", "tags": ["new", "fresh"]}
    response = await client.patch(f"{settings.API_V1_STR}/characters/{char_id}", json=update_data)
    assert response.status_code == 200
    content = response.json()
    assert content["name"] == "Updated Name"
    assert len(content["tags"]) == 2
    tags = [t["name"] for t in content["tags"]]
    assert "new" in tags
    assert "fresh" in tags
    assert "old" not in tags

@pytest.mark.asyncio
async def test_delete_character(client: AsyncClient):
    # First create
    data = {"name": "To Delete"}
    create_res = await client.post(f"{settings.API_V1_STR}/characters/", json=data)
    char_id = create_res.json()["id"]
    
    # Delete
    response = await client.delete(f"{settings.API_V1_STR}/characters/{char_id}")
    assert response.status_code == 200
    assert response.json()["is_active"] == False
    
    # Verify list doesn't return it
    list_res = await client.get(f"{settings.API_V1_STR}/characters/")
    ids = [c["id"] for c in list_res.json()]
    assert char_id not in ids

@pytest.mark.asyncio
async def test_create_dataset_50_samples(client: AsyncClient):
    # Create 50 characters
    for i in range(50):
        data = {
            "name": f"NPC_{i}",
            "description": f"Description for NPC {i}",
            "personality": "Generic",
            "tags": [f"tag_{i%5}"], # 5 distinct tags
            "custom_attributes": {"index": i}
        }
        response = await client.post(f"{settings.API_V1_STR}/characters/", json=data)
        assert response.status_code == 200
        
    # Verify count
    response = await client.get(f"{settings.API_V1_STR}/characters/?limit=100")
    assert response.status_code == 200
    # There might be other characters from previous tests, so just check >= 50
    assert len(response.json()) >= 50
