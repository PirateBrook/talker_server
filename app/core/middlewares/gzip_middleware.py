import gzip
from fastapi import Request, Response
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.types import ASGIApp

class GZipRequestMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        content_encoding = request.headers.get("content-encoding", "").lower()
        
        if content_encoding == "gzip":
            try:
                body = await request.body()
                uncompressed = gzip.decompress(body)
                
                # Replace body with uncompressed data
                async def receive():
                    return {"type": "http.request", "body": uncompressed}
                request._receive = receive
                
                # Update Content-Length header to match uncompressed size
                # Note: headers are immutable in Starlette, so we modify the scope directly if needed
                # or just let downstream handle it. FastAPI usually relies on body stream.
                
            except Exception as e:
                # If decompression fails, let downstream handle the error or return 400
                pass
                
        return await call_next(request)
