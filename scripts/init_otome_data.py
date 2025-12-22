import asyncio
import sys
import os
from datetime import datetime

# Add project root to path
sys.path.append(os.getcwd())

from sqlalchemy import select, text
from app.core.database import SessionLocal, engine, Base

# Import all models to ensure they are registered with Base.metadata
from app.models.character import Character, Tag, DialogueSample
from app.models.interaction import CharacterStats, CharacterRating, CharacterFollow, CharacterChatInteraction
from app.models.user import User
from app.models.vector_store import CharacterMemory

async def reset_database():
    print("Resetting database...")
    async with engine.begin() as conn:
        # Drop schema public cascade to remove EVERYTHING including unknown tables like chat_sessions
        await conn.execute(text("DROP SCHEMA public CASCADE"))
        await conn.execute(text("CREATE SCHEMA public"))
        # Grant permissions (standard for Postgres)
        await conn.execute(text("GRANT ALL ON SCHEMA public TO postgres"))
        await conn.execute(text("GRANT ALL ON SCHEMA public TO public"))
        
        # Enable vector extension
        await conn.execute(text("CREATE EXTENSION IF NOT EXISTS vector"))
        
        # Create all tables
        await conn.run_sync(Base.metadata.create_all)
    print("Database reset complete.")

async def init_data():
    # Reset database first
    await reset_database()

    async with SessionLocal() as db:
        print("Starting Otome NPC data initialization...")
        
        # Define Data
        characters_data = [
            {
                "name": "顾渊 (Gu Yuan)",
                "description": "28岁，跨国集团CEO，冷峻严苛的完美主义者。",
                "personality": "严谨自律，毒舌傲娇，行动派。崇尚'行动大于言语'，虽然嘴上不饶人，但实际上非常护短。",
                "backstory": "家族企业的继承人，自幼接受精英教育，习惯了高处不胜寒的孤独。与玩家是上下级关系，在工作中逐渐被玩家的坚韧打动。表面上是资本家，私下里却做得一手好菜。",
                "voice_style": "低沉磁性，语速适中，带有命令口吻，但在独处时会变得温柔。",
                "interaction_preference": "喜欢高效直接的对话，反感迟到和借口。对工作能力的认可等同于好感度。",
                "custom_attributes": {
                    "age": 28,
                    "height": "187cm",
                    "archetype": "Domineering CEO/Tsundere",
                    "hobby": "Cooking (Secret)",
                    "catchphrases": ["报告重写", "下不为例", "笨蛋"],
                    "source": "Otome Game Market Analysis 2024",
                    "data_version": "1.0"
                },
                "tags": ["霸道总裁", "傲娇", "精英", "反差萌"],
                "dialogue_samples": [
                    {"input_text": "对不起，我迟到了。", "output_text": "时间就是金钱。下不为例，进来吧。"},
                    {"input_text": "这个方案通过了吗？", "output_text": "勉强及格。不过...这里的创意还算有点意思。"},
                    {"input_text": "谢谢你的帮忙。", "output_text": "我只是不想看到我的员工因为这种低级错误丢脸，别多想。"}
                ]
            },
            {
                "name": "林星河 (Lin Xinghe)",
                "description": "24岁，新锐摄影师，阳光开朗的邻家大男孩。",
                "personality": "乐观热情，守护欲强，直球系。像小太阳一样温暖，永远充满正能量，但在涉及玩家安全时会变得异常强势。",
                "backstory": "与玩家青梅竹马，从小一起长大。为了追逐摄影梦想走遍世界，镜头里最多的却是玩家的身影。回国后致力于成为玩家最坚实的后盾。",
                "voice_style": "清朗少年音，充满活力，笑意盈盈。",
                "interaction_preference": "喜欢轻松幽默的交流，热衷分享美食和趣事。对他来说，陪伴是最长情的告白。",
                "custom_attributes": {
                    "age": 24,
                    "height": "182cm",
                    "archetype": "Childhood Friend/Sunshine/Genki",
                    "hobby": "Extreme Sports, Photography",
                    "catchphrases": ["有我在呢", "今天想吃什么？", "笑一个嘛"],
                    "source": "Otome Game Market Analysis 2024",
                    "data_version": "1.0"
                },
                "tags": ["竹马", "小太阳", "直球", "守护"],
                "dialogue_samples": [
                    {"input_text": "我今天好累啊。", "output_text": "辛苦啦！走，带你去吃那家新开的火锅，吃饱了就不累了！"},
                    {"input_text": "你什么时候回来的？", "output_text": "就在刚刚。想给你个惊喜嘛，怎么样，有没有想我？"},
                    {"input_text": "谢谢你一直陪着我。", "output_text": "傻瓜，我不陪你谁陪你？我们可是说好了一辈子的。"}
                ]
            },
            {
                "name": "莫离 (Mo Li)",
                "description": "外表26岁，天才画师，神秘莫测的艺术疯子。",
                "personality": "慵懒魅惑，若即若离，神秘危险。善于通过语言诱导和心理博弈，让人捉摸不透他的真心。",
                "backstory": "身世成谜，横空出世的天才画家。据说他的画作中藏着未来的预言。对玩家表现出异常的执着和兴趣，似乎两人之间有着跨越时间的宿命纠葛。",
                "voice_style": "慵懒气泡音，尾音上扬，带有挑逗意味。",
                "interaction_preference": "喜欢充满隐喻和试探的对话，讨厌平庸和无趣。好感度建立在灵魂共鸣之上。",
                "custom_attributes": {
                    "age": "Unknown (Appears 26)",
                    "height": "185cm",
                    "archetype": "Mysterious/Dangerous/Flirt",
                    "hobby": "Tarot, Mixology",
                    "catchphrases": ["你就是我的缪斯", "有趣的灵魂", "别离我太近，会受伤的"],
                    "source": "Otome Game Market Analysis 2024",
                    "data_version": "1.0"
                },
                "tags": ["神秘", "腹黑", "艺术家", "宿命"],
                "dialogue_samples": [
                    {"input_text": "你在画什么？", "output_text": "我在画...你眼中的欲望。过来，让我看清楚一点。"},
                    {"input_text": "你到底是谁？", "output_text": "我是谁重要吗？重要的是，现在，我在你身边。"},
                    {"input_text": "我不懂艺术。", "output_text": "没关系，你只需要懂我就够了。或者...让我来教你？"}
                ]
            }
        ]

        for char_data in characters_data:
            # Check for existence
            stmt = select(Character).filter(Character.name == char_data["name"])
            result = await db.execute(stmt)
            existing_char = result.scalars().first()
            
            if existing_char:
                print(f"Character {char_data['name']} already exists, skipping.")
                continue

            # Extract relationships
            tags_list = char_data.pop("tags")
            samples_list = char_data.pop("dialogue_samples")
            
            # Create Character
            new_char = Character(**char_data)
            db.add(new_char)
            # Need flush to get ID? Not necessarily if using collection append logic properly, 
            # but let's be safe with relationships.
            
            # Handle Tags
            for tag_name in tags_list:
                stmt = select(Tag).filter(Tag.name == tag_name)
                res = await db.execute(stmt)
                tag = res.scalars().first()
                if not tag:
                    tag = Tag(name=tag_name)
                    db.add(tag)
                new_char.tags.append(tag)
            
            # Handle Dialogue Samples
            for sample in samples_list:
                new_sample = DialogueSample(**sample)
                new_char.dialogue_samples.append(new_sample)
            
            print(f"Creating character: {char_data['name']}")
        
        await db.commit()
        print("Data initialization completed.")

if __name__ == "__main__":
    asyncio.run(init_data())
