from fastapi import Request
from starlette.middleware.base import BaseHTTPMiddleware
from app.core.config import settings
import logging

logger = logging.getLogger(__name__)

class LoggingMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        if not settings.DEBUG_REQUEST_BODY:
            return await call_next(request)

        # We need to read the body to log it. 
        # Note: If GZip middleware ran before this, the body is already decompressed.
        # However, reading body consumes the stream.
        
        try:
            body_bytes = await request.body()
            
            # Re-package for downstream
            async def receive():
                return {"type": "http.request", "body": body_bytes}
            request._receive = receive
            
            try:
                body_str = body_bytes.decode("utf-8")
            except Exception:
                body_str = "<binary>"
                
            # Using print for visibility as per debugging session
            print(f"\n[DEBUG] Incoming Request: {request.method} {request.url}")
            print(f"[DEBUG] Headers: {dict(request.headers)}")
            print(f"[DEBUG] Body: {body_str}\n")
            
        except Exception as e:
            logger.error(f"Error reading request body in logging middleware: {e}")
            
        response = await call_next(request)
        return response
