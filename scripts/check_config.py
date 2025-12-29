import sys
import os
from app.core.config import settings

def check_settings():
    print(f"OPENAI_API_KEY loaded: {'Yes' if settings.OPENAI_API_KEY else 'No'}")
    if settings.OPENAI_API_KEY:
        # Print first few chars to verify (safe log)
        print(f"Key starts with: {settings.OPENAI_API_KEY[:10]}...")
    print(f"OPENAI_API_BASE_URL: {settings.OPENAI_API_BASE_URL}")

if __name__ == "__main__":
    check_settings()
