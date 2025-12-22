import pytest
from fastapi.testclient import TestClient
from unittest.mock import AsyncMock, MagicMock, patch
from app.main import app
from app.core.config import settings
from app.services.chat_stream import WebSocketCallbackHandler, chat_manager
from app.api.v1.endpoints.chat import get_current_user_ws
from app.core.database import get_db
from app.models.user import User

# We don't need pytest.mark.asyncio here because TestClient is synchronous
def test_websocket_chat_flow(sync_client: TestClient):
    # 1. Mock dependencies
    mock_user = User(id=1, email="test@example.com", is_active=True)
    
    # Override the WebSocket dependency
    async def mock_get_current_user_ws():
        return mock_user
    
    async def mock_get_db_session():
        yield MagicMock()

    app.dependency_overrides[get_current_user_ws] = mock_get_current_user_ws
    app.dependency_overrides[get_db] = mock_get_db_session
    
    try:
        # Better approach: Mock the internals of ChatManager in app.services.chat_stream
        with patch("app.services.chat_stream.chat_manager.llm") as mock_llm, \
             patch("app.services.chat_stream.chat_manager.redis") as mock_redis, \
             patch("app.services.chat_stream.chat_manager.mongo_collection") as mock_mongo, \
             patch.object(chat_manager, 'get_character_system_prompt', new=AsyncMock(return_value="You are a test bot.")) as mock_prompt, \
             patch.object(chat_manager, 'get_rag_context', new=AsyncMock(return_value="")) as mock_rag:
            
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
                websocket.send_json({
                    "type": "chat",
                    "character_id": 1,
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
    mock_user = User(id=1, email="test@example.com", is_active=True)
    async def mock_get_current_user_ws():
        return mock_user
    
    async def mock_get_db_session():
        yield MagicMock()

    app.dependency_overrides[get_current_user_ws] = mock_get_current_user_ws
    app.dependency_overrides[get_db] = mock_get_db_session
    
    try:
        with patch("app.services.chat_stream.chat_manager.mongo_collection") as mock_mongo:
            mock_mongo.insert_one = AsyncMock()
            
            # 3. Connect WebSocket
            with sync_client.websocket_connect(f"{settings.API_V1_STR}/chat/ws?token=dummy") as websocket:
                # Send Action Message
                websocket.send_json({
                    "type": "action",
                    "character_id": 1,
                    "action_id": "inspect",
                    "target_id": "item_123"
                })
                
                # Receive Game Event
                event_msg = websocket.receive_json()
                assert event_msg["type"] == "game_event"
                assert event_msg["event_type"] == "action_result"
                assert event_msg["payload"]["action"] == "inspect"
    finally:
        app.dependency_overrides = {}
