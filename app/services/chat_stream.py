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
from app.schemas.chat_log import ChatLog
from app.models.character import Character
from app.models.vector_store import CharacterMemory

logger = logging.getLogger(__name__)

class WebSocketCallbackHandler(AsyncCallbackHandler):
    """Callback handler that streams LLM tokens to a WebSocket."""
    
    def __init__(self, websocket: WebSocket):
        self.websocket = websocket
        self.seq = 0
        self.accumulated_content = ""

    async def on_llm_start(
        self, serialized: Dict[str, Any], prompts: List[str], **kwargs: Any
    ) -> None:
        """Run when LLM starts running."""
        self.seq = 0
        self.accumulated_content = ""
        await self.websocket.send_text(
            AIStatusMessage(status="thinking").model_dump_json()
        )

    async def on_llm_new_token(self, token: str, **kwargs: Any) -> None:
        """Run on new LLM token. Only available when streaming is enabled."""
        self.seq += 1
        self.accumulated_content += token
        try:
            await self.websocket.send_text(
                AIChunkMessage(content=token, seq=self.seq).model_dump_json()
            )
        except RuntimeError:
            # WebSocket might be closed
            pass

    async def on_llm_end(self, response: Any, **kwargs: Any) -> None:
        """Run when LLM ends running."""
        try:
            await self.websocket.send_text(
                AIEndMessage(full_content=self.accumulated_content).model_dump_json()
            )
        except RuntimeError:
            pass

    async def on_llm_error(self, error: BaseException, **kwargs: Any) -> None:
        """Run when LLM errors."""
        try:
            await self.websocket.send_text(
                ErrorMessage(code="LLM_ERROR", message=str(error)).model_dump_json()
            )
        except RuntimeError:
            pass

class ChatManager:
    def __init__(self):
        self.redis = redis_client
        self.mongo_collection: AsyncIOMotorCollection = mongo_db["chat_logs"]
        # Initialize LLM (Ensure OPENAI_API_KEY is set in env or settings)
        self.llm = ChatOpenAI(
            api_key=settings.OPENAI_API_KEY,
            streaming=True,
            temperature=0.7,
            model="gpt-4" # Configurable
        )
        self.embeddings = OpenAIEmbeddings(
            api_key=settings.OPENAI_API_KEY,
            model="text-embedding-3-small" # Using a cheaper/newer model if available, or ada-002
        )

    async def get_rag_context(self, db: AsyncSession, character_id: int, query: str, limit: int = 3) -> str:
        """Retrieve relevant memories or knowledge from vector store."""
        try:
            # Generate embedding
            # OpenAIEmbeddings.embed_query is synchronous, run in thread
            embedding = await asyncio.to_thread(self.embeddings.embed_query, query)
            
            # Search in DB
            stmt = select(CharacterMemory).where(
                CharacterMemory.character_id == character_id
            ).order_by(
                CharacterMemory.embedding.l2_distance(embedding)
            ).limit(limit)
            
            result = await db.execute(stmt)
            memories = result.scalars().all()
            
            if not memories:
                return ""
                
            context_str = "\n".join([f"- {m.content}" for m in memories])
            return f"\nRelevant Memories/Context:\n{context_str}\n"
        except Exception as e:
            logger.error(f"Error retrieving RAG context: {e}")
            return ""

    async def get_character_system_prompt(self, db: AsyncSession, character_id: int) -> str:
        """Build system prompt based on character profile."""
        stmt = select(Character).where(Character.id == character_id)
        result = await db.execute(stmt)
        character = result.scalar_one_or_none()
        
        if not character:
            return "You are a helpful AI assistant in a game."
            
        prompt = f"You are {character.name}.\n"
        if character.description:
            prompt += f"Description: {character.description}\n"
        if character.personality:
            prompt += f"Personality: {character.personality}\n"
        if character.backstory:
            prompt += f"Backstory: {character.backstory}\n"
        if character.voice_style:
            prompt += f"Speaking Style: {character.voice_style}\n"
            
        prompt += "\nRespond in character. Keep responses concise and engaging. Do not break character."
        return prompt

    async def handle_websocket(
        self, 
        websocket: WebSocket, 
        user_id: int, 
        db: AsyncSession
    ):
        await websocket.accept()
        connection_id = f"{user_id}_{int(datetime.now().timestamp())}"
        
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
                        # Derive session_id for this character conversation
                        # Using a persistent session key: user_id + character_id
                        # But for now, to keep history separate per connection (if desired), we can use connection_id + character_id
                        # Let's stick to user_id + character_id for persistence across connections if that's the goal of "multiplexing" usually implies efficiency, not necessarily persistence change.
                        # But the previous implementation had timestamp in session_id.
                        # Let's use f"{user_id}_{character_id}" as the base for history, 
                        # but for the `session_id` used in logging, maybe we want it unique per interaction?
                        # Let's use f"{user_id}_{character_id}_{int(datetime.now().timestamp())}" effectively meaning new session per message? No, that breaks context.
                        # We need a stable session ID for the duration of this connection.
                        
                        character_id = client_msg.character_id
                        # Use connection_id as base, append character_id to make it unique per character stream
                        session_id = f"{connection_id}_{character_id}"

                        await self.process_chat_message(
                            client_msg, websocket, session_id, user_id, character_id, stream_handler, db
                        )
                    
                    elif msg_type == MessageType.ACTION:
                        client_msg = ActionMessage(**msg_dict)
                        character_id = client_msg.character_id
                        session_id = f"{connection_id}_{character_id}"

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
            logger.info(f"WebSocket disconnected for session {session_id}")
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
        user_id: int, 
        character_id: int,
        stream_handler: WebSocketCallbackHandler,
        db: AsyncSession
    ):
        # 1. Save User Message to MongoDB
        user_log = ChatLog(
            session_id=session_id,
            user_id=user_id,
            character_id=character_id,
            role="user",
            content=msg.content
        )
        await self.mongo_collection.insert_one(user_log.model_dump())

        # 2. Retrieve History from Redis
        redis_key = f"chat:context:{session_id}"
        history_json = await self.redis.lrange(redis_key, 0, -1)
        history: List[BaseMessage] = []
        
        # 3. Build System Prompt & Context
        system_prompt = await self.get_character_system_prompt(db, character_id)
        
        # 4. RAG Retrieval
        rag_context = await self.get_rag_context(db, character_id, msg.content)
        if rag_context:
            system_prompt += rag_context
            
        history.append(SystemMessage(content=system_prompt))
        
        for h in history_json:
            msg_data = json.loads(h)
            if msg_data["type"] == "human":
                history.append(HumanMessage(content=msg_data["content"]))
            elif msg_data["type"] == "ai":
                history.append(AIMessage(content=msg_data["content"]))
        
        # Add current user message
        history.append(HumanMessage(content=msg.content))

        # 5. Call LLM with Streaming
        # We use aconfig to pass callbacks
        response = await self.llm.ainvoke(
            history,
            config={"callbacks": [stream_handler]}
        )
        
        ai_content = response.content

        # 6. Save AI Message to MongoDB
        ai_log = ChatLog(
            session_id=session_id,
            user_id=user_id,
            character_id=character_id,
            role="ai",
            content=ai_content
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
        user_id: int, 
        character_id: int,
        db: AsyncSession
    ):
        # 1. Log Action
        action_log = ChatLog(
            session_id=session_id,
            user_id=user_id,
            character_id=character_id,
            role="user",
            content=f"[ACTION] {msg.action_id} on {msg.target_id}",
            action_type=msg.action_id,
            metadata=msg.payload
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
