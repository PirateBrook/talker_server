import json
import asyncio
import logging
from typing import Any, Dict, List, Optional
from datetime import datetime

from fastapi import WebSocket, WebSocketDisconnect
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from langchain_core.callbacks import AsyncCallbackHandler
from langchain_core.messages import HumanMessage, AIMessage, SystemMessage, BaseMessage
from motor.motor_asyncio import AsyncIOMotorCollection

from app.core.database import redis_client, mongo_db
from app.core.config import settings
from app.schemas.protocol import (
    ClientMessage, ChatMessage, ActionMessage, MessageType,
    AIStatusMessage, AIChunkMessage, AIEndMessage, GameEventMessage, ErrorMessage,
    ServerMessageType
)
from app.schemas.message_record import MessageRecord
from app.schemas.common import MessageContentType
from app.models.character import Character
from app.models.vector_store import CharacterMemory
from app.models.chat_session import ChatSession
from app.services.session_service import session_service
from app.services.callbacks import WebSocketCallbackHandler
from app.services.chat_agent import chat_agent
import uuid

logger = logging.getLogger(__name__)

class ChatManager:
    def __init__(self):
        self.redis = redis_client
        self.mongo_collection: AsyncIOMotorCollection = mongo_db["chat_logs"]
        self.agent = chat_agent

    async def handle_websocket(
        self, 
        websocket: WebSocket, 
        user_id: uuid.UUID, 
        db: AsyncSession
    ):
        await websocket.accept()
        connection_id = f"{user_id}_{int(datetime.now().timestamp())}"
        session_id = None
        
        # Callback handler for this specific connection
        stream_handler = WebSocketCallbackHandler(websocket)
        
        try:
            while True:
                data = await websocket.receive_text()
                try:
                    # Parse generic message first to check type
                    msg_dict = json.loads(data)
                    msg_type = msg_dict.get("type")
                    
                    if msg_type == MessageType.CHAT:
                        client_msg = ChatMessage(**msg_dict)
                        
                        character_id = client_msg.character_id
                        
                        # Get or create active session
                        active_session = await session_service.get_active_session(db, user_id, character_id)
                        session_id = str(active_session.id)

                        await self.process_chat_message(
                            client_msg, websocket, session_id, user_id, character_id, stream_handler, db
                        )
                    
                    elif msg_type == MessageType.ACTION:
                        client_msg = ActionMessage(**msg_dict)
                        character_id = client_msg.character_id
                        
                        # Get active session for action context too
                        active_session = await session_service.get_active_session(db, user_id, character_id)
                        session_id = str(active_session.id)

                        await self.process_action_message(
                            client_msg, websocket, session_id, user_id, character_id, db
                        )
                    
                    else:
                        await websocket.send_text(
                            ErrorMessage(code="INVALID_TYPE", message=f"Unknown message type: {msg_type}").model_dump_json()
                        )

                except json.JSONDecodeError:
                    await websocket.send_text(
                        ErrorMessage(code="JSON_ERROR", message="Invalid JSON").model_dump_json()
                    )
                except Exception as e:
                    logger.error(f"Error processing message: {e}", exc_info=True)
                    await websocket.send_text(
                        ErrorMessage(code="INTERNAL_ERROR", message=str(e)).model_dump_json()
                    )

        except WebSocketDisconnect:
            logger.info(f"WebSocket disconnected for session {session_id if session_id else connection_id}")
        except Exception as e:
            logger.error(f"WebSocket error: {e}", exc_info=True)
        finally:
            # Cleanup if needed
            pass

    async def process_chat_message(
        self, 
        msg: ChatMessage, 
        websocket: WebSocket, 
        session_id: str, 
        user_id: uuid.UUID, 
        character_id: uuid.UUID,
        stream_handler: WebSocketCallbackHandler,
        db: AsyncSession
    ):
        # 1. Save User Message to MongoDB
        user_log = MessageRecord(
            session_id=session_id,
            user_id=str(user_id),
            character_id=character_id,
            role="user",
            content=msg.content,
            content_type=msg.content_type,
            metadata=msg.metadata
        )
        await self.mongo_collection.insert_one(user_log.model_dump())

        # 2. Retrieve History from Redis
        redis_key = f"chat:context:{session_id}"
        history_json = await self.redis.lrange(redis_key, 0, -1)
        
        # 3. Run Agent Logic
        ai_message_id = str(uuid.uuid7())
        stream_handler.set_message_id(ai_message_id)
        
        ai_content = await self.agent.run(
            db,
            character_id,
            session_id,
            msg.content,
            history_json,
            stream_handler
        )

        # 6. Save AI Message to MongoDB
        ai_log = MessageRecord(
            id=ai_message_id,
            session_id=session_id,
            user_id=str(user_id),
            character_id=character_id,
            role="ai",
            content=ai_content,
            content_type=MessageContentType.TEXT
        )
        await self.mongo_collection.insert_one(ai_log.model_dump())

        # 7. Update Redis History (Window of last 20 messages)
        # Push User Msg
        await self.redis.rpush(redis_key, json.dumps({"type": "human", "content": msg.content}))
        # Push AI Msg
        await self.redis.rpush(redis_key, json.dumps({"type": "ai", "content": ai_content}))
        
        # Trim to keep last 20
        await self.redis.ltrim(redis_key, -20, -1)
        # Set TTL
        await self.redis.expire(redis_key, 1800) # 30 mins

    async def process_action_message(
        self, 
        msg: ActionMessage, 
        websocket: WebSocket, 
        session_id: str, 
        user_id: uuid.UUID, 
        character_id: uuid.UUID,
        db: AsyncSession
    ):
        # 1. Log Action
        action_log = MessageRecord(
            session_id=session_id,
            user_id=str(user_id),
            character_id=character_id,
            role="user",
            content=f"[ACTION] {msg.action_id} on {msg.target_id}",
            action_type=msg.action_id,
            metadata=msg.payload,
            content_type=MessageContentType.TEXT
        )
        await self.mongo_collection.insert_one(action_log.model_dump())

        # 2. Handle Game Logic
        # Placeholder: Check if action is valid, roll dice, etc.
        # For now, simple echo/success
        
        response_payload = {"status": "success", "action": msg.action_id}
        
        if msg.action_id == "inspect":
            response_payload["description"] = f"You inspect the {msg.target_id}. It looks interesting."
        elif msg.action_id == "touch":
             response_payload["description"] = f"You touch the {msg.target_id}. Nothing happens."
        
        # 3. Send Feedback
        await websocket.send_text(
            GameEventMessage(
                event_type="action_result",
                payload=response_payload
            ).model_dump_json()
        )

chat_manager = ChatManager()
