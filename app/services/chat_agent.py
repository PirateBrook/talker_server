import json
import asyncio
import logging
import uuid
from typing import List, Optional

from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from langchain_core.messages import HumanMessage, AIMessage, SystemMessage, BaseMessage

from app.core.config import settings
from app.models.character import Character
from app.models.vector_store import CharacterMemory
from app.services.callbacks import WebSocketCallbackHandler

logger = logging.getLogger(__name__)

class ChatAgent:
    def __init__(self):
        # Initialize LLM (Ensure OPENAI_API_KEY is set in env or settings)
        if not settings.OPENAI_API_KEY:
            logger.warning("OPENAI_API_KEY is not set in settings. Chat functionality may fail.")

        self.llm = ChatOpenAI(
            openai_api_key=settings.OPENAI_API_KEY,
            openai_api_base=settings.OPENAI_API_BASE_URL,
            streaming=True,
            temperature=0.7,
            model="deepseek/deepseek-r1-0528:free" # Configurable
        )
        self.embeddings = OpenAIEmbeddings(
            openai_api_key=settings.OPENAI_API_KEY,
            openai_api_base=settings.OPENAI_API_BASE_URL,
            model="text-embedding-3-small" # Using a cheaper/newer model if available, or ada-002
        )

    async def get_rag_context(self, db: AsyncSession, character_id: uuid.UUID, query: str, limit: int = 3, session_id: Optional[str] = None) -> str:
        """Retrieve relevant memories or knowledge from vector store.
           TODO: Add session_id filtering for episodic memory if needed.
        """
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

    async def get_character_system_prompt(self, db: AsyncSession, character_id: uuid.UUID) -> str:
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

    async def run(
        self,
        db: AsyncSession,
        character_id: uuid.UUID,
        session_id: str,
        user_content: str,
        history_json: List[str],
        stream_handler: WebSocketCallbackHandler
    ) -> str:
        # 3. Build System Prompt & Context
        system_prompt = await self.get_character_system_prompt(db, character_id)
        
        # 4. RAG Retrieval
        rag_context = await self.get_rag_context(db, character_id, user_content, session_id=session_id)
        if rag_context:
            system_prompt += rag_context
            
        history: List[BaseMessage] = []
        history.append(SystemMessage(content=system_prompt))
        
        for h in history_json:
            msg_data = json.loads(h)
            if msg_data["type"] == "human":
                history.append(HumanMessage(content=msg_data["content"]))
            elif msg_data["type"] == "ai":
                history.append(AIMessage(content=msg_data["content"]))
        
        # Add current user message
        history.append(HumanMessage(content=user_content))

        # 5. Call LLM with Streaming
        # We use aconfig to pass callbacks
        response = await self.llm.ainvoke(
            history,
            config={"callbacks": [stream_handler]}
        )
        
        return response.content

chat_agent = ChatAgent()
