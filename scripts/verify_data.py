import asyncio
import sys
import os
from sqlalchemy import select, text

# Add project root to path
sys.path.append(os.getcwd())

from sqlalchemy import select, text
from sqlalchemy.orm import selectinload
from app.core.database import SessionLocal
from app.models.character import Character

async def verify_data():
    async with SessionLocal() as db:
        print("--- Verifying Database Content ---")
        
        # Check Database Name
        res = await db.execute(text("SELECT current_database()"))
        db_name = res.scalar()
        print(f"Connected to Database: {db_name}")
        
        # Count Characters
        res = await db.execute(
            select(Character)
            .options(selectinload(Character.tags))
        )
        chars = res.scalars().all()
        print(f"Total Characters found: {len(chars)}")
        
        for char in chars:
            tag_names = [t.name for t in char.tags]
            print(f"- [{char.id}] {char.name}: {tag_names}")

if __name__ == "__main__":
    asyncio.run(verify_data())
