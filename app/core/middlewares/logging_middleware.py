import logging
from fastapi import Request
from starlette.middleware.base import BaseHTTPMiddleware

logger = logging.getLogger(__name__)

class LoggingMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        # We need to read the body to log it. 
        # Note: If GZip middleware ran before this, the body is already decompressed.
        # However, reading body consumes the stream.
        
        body_bytes = await request.body()
        
        # Re-package for downstream
        async def receive():
            return {"type": "http.request", "body": body_bytes}
        request._receive = receive
        
        try:
            body_str = body_bytes.decode("utf-8")
        except Exception:
            body_str = "<binary>"
            
        # Using print for visibility as per debugging session, 
        # but in production should use logger
        print(f"Incoming Request: {request.method} {request.url}")
        print(f"Headers: {request.headers}")
        print(f"Body: {body_str}")
        
        response = await call_next(request)
        return response
