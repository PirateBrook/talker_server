import sys
import os
import asyncio
from fastapi import FastAPI

# Add project root to path
sys.path.append(os.getcwd())

from app.main import app

def print_routes():
    print("Registered Routes:")
    for route in app.routes:
        if hasattr(route, "path"):
            methods = getattr(route, "methods", None)
            print(f"  {route.path} {methods if methods else ''}")

if __name__ == "__main__":
    print_routes()
