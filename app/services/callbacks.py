from typing import Any, Dict, List
from fastapi import WebSocket
from langchain_core.callbacks import AsyncCallbackHandler
from app.schemas.protocol import AIStatusMessage, AIChunkMessage, AIEndMessage, ErrorMessage

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
