import pytest
from fastapi.testclient import TestClient
from unittest.mock import AsyncMock, MagicMock, patch
from app.main import app
from app.core.config import settings
from app.services.chat_stream import WebSocketCallbackHandler, chat_manager
from app.api.v1.endpoints.chat import get_current_user_ws
from app.core.database import get_db
import uuid6
from app.models.user import User

# We don't need pytest.mark.asyncio here because TestClient is synchronous
def test_websocket_chat_flow(sync_client: TestClient):
    # 1. Mock dependencies
    mock_user = User(id=uuid6.uuid7(), email="test@example.com", is_active=True)
    
    # Override the WebSocket dependency
    async def mock_get_current_user_ws():
        return mock_user
    
    async def mock_get_db_session():
        mock_db = AsyncMock()
        mock_db.commit = AsyncMock()
        mock_db.refresh = AsyncMock()
        mock_db.execute = AsyncMock(return_value=MagicMock(scalars=lambda: MagicMock(first=lambda: None, all=lambda: [])))
        mock_db.add = MagicMock()
        yield mock_db

    app.dependency_overrides[get_current_user_ws] = mock_get_current_user_ws
    app.dependency_overrides[get_db] = mock_get_db_session
    
    try:
        # Better approach: Mock the internals of ChatManager in app.services.chat_stream
        with patch("app.services.chat_stream.chat_manager.agent.llm") as mock_llm, \
             patch("app.services.chat_stream.chat_manager.redis") as mock_redis, \
             patch("app.services.chat_stream.chat_manager.mongo_collection") as mock_mongo, \
             patch("app.services.chat_stream.chat_manager.agent.get_character_system_prompt", new=AsyncMock(return_value="You are a test bot.")) as mock_prompt, \
             patch("app.services.chat_stream.chat_manager.agent.get_rag_context", new=AsyncMock(return_value="")) as mock_rag:
            
            # Mock Redis Lrange
            mock_redis.lrange = AsyncMock(return_value=[])
            mock_redis.rpush = AsyncMock()
            mock_redis.ltrim = AsyncMock()
            mock_redis.expire = AsyncMock()
            
            # Mock Mongo
            mock_mongo.insert_one = AsyncMock()

            # Mock LLM
            mock_llm.ainvoke = AsyncMock()
            # Define side effect to simulate streaming
            async def side_effect(messages, config):
                callbacks = config.get("callbacks", [])
                for callback in callbacks:
                    if isinstance(callback, WebSocketCallbackHandler):
                        await callback.on_llm_start({}, [])
                        await callback.on_llm_new_token("Hello")
                        await callback.on_llm_new_token("!")
                        await callback.on_llm_end(None)
                return MagicMock(content="Hello!")
            
            mock_llm.ainvoke.side_effect = side_effect

            # 3. Connect WebSocket
            # Token can be dummy since we overrode the dependency
            with sync_client.websocket_connect(f"{settings.API_V1_STR}/chat/ws?token=dummy") as websocket:
                # Send Chat Message
                char_id = str(uuid6.uuid7())
                websocket.send_json({
                    "type": "chat",
                    "character_id": char_id,
                    "content": "Hi there"
                })
                
                # Receive Status
                status_msg = websocket.receive_json()
                assert status_msg["type"] == "ai_status"
                assert status_msg["status"] == "thinking"
                
                # Receive Chunk 1
                chunk1 = websocket.receive_json()
                assert chunk1["type"] == "ai_chunk"
                assert chunk1["content"] == "Hello"
                
                # Receive Chunk 2
                chunk2 = websocket.receive_json()
                assert chunk2["type"] == "ai_chunk"
                assert chunk2["content"] == "!"
                
                # Receive End
                end_msg = websocket.receive_json()
                assert end_msg["type"] == "ai_end"
                assert end_msg["full_content"] == "Hello!"

    finally:
        app.dependency_overrides = {}

def test_websocket_action_flow(sync_client: TestClient):
    # 1. Mock dependencies
    mock_user = User(id=uuid6.uuid7(), email="test@example.com", is_active=True)
    async def mock_get_current_user_ws():
        return mock_user
    
    async def mock_get_db_session():
        mock_db = AsyncMock()
        mock_db.commit = AsyncMock()
        mock_db.refresh = AsyncMock()
        mock_db.execute = AsyncMock(return_value=MagicMock(scalars=lambda: MagicMock(first=lambda: None, all=lambda: [])))
        mock_db.add = MagicMock()
        yield mock_db

    app.dependency_overrides[get_current_user_ws] = mock_get_current_user_ws
    app.dependency_overrides[get_db] = mock_get_db_session
    
    try:
        with patch("app.services.chat_stream.chat_manager.mongo_collection") as mock_mongo, \
             patch("app.services.session_service.redis_client", new=AsyncMock()) as mock_redis:
            mock_mongo.insert_one = AsyncMock()
            mock_redis.get = AsyncMock(return_value=None) # Simulate no session in Redis
            mock_redis.set = AsyncMock()
            
            # 3. Connect WebSocket
            with sync_client.websocket_connect(f"{settings.API_V1_STR}/chat/ws?token=dummy") as websocket:
                # Send Action Message
                char_id = str(uuid6.uuid7())
                websocket.send_json({
                    "type": "action",
                    "character_id": char_id,
                    "action_id": "inspect",
                    "target_id": "item_123"
                })
                
                # Receive Game Event
                event_msg = websocket.receive_json()
                if event_msg["type"] == "error":
                    print(f"DEBUG ERROR: {event_msg}")
                assert event_msg["type"] == "game_event"
                assert event_msg["event_type"] == "action_result"
                assert event_msg["payload"]["action"] == "inspect"
                assert event_msg["payload"]["target_id"] == "item_123"

    finally:
        app.dependency_overrides = {}
