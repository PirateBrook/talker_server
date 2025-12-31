from typing import List, Optional
import uuid
import logging
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, and_, func
from sqlalchemy.orm import selectinload

from app.models.character import Character, Tag, character_tags as CharacterTag
from app.models.interaction import CharacterFollow, CharacterChatInteraction
from app.models.social_request import FriendRequest, FriendRequestStatus
from app.schemas.recommendation import RecommendationEventType

logger = logging.getLogger(__name__)

class RecommendationService:
    """
    Manages friend requests and recommendation rules.
    This service is decoupled from the main flow using BackgroundTasks where possible.
    """

    # --- Core Logic ---
    
    async def get_pending_requests(
        self, 
        db: AsyncSession, 
        user_id: uuid.UUID
    ) -> List[FriendRequest]:
        stmt = (
            select(FriendRequest)
            .options(selectinload(FriendRequest.character))
            .filter(
                FriendRequest.user_id == user_id,
                FriendRequest.status == FriendRequestStatus.PENDING.value
            )
            .order_by(FriendRequest.created_at.desc())
        )
        result = await db.execute(stmt)
        return result.scalars().all()

    async def handle_request_action(
        self,
        db: AsyncSession,
        user_id: uuid.UUID,
        request_id: int,
        action: str
    ) -> Optional[FriendRequest]:
        """
        Handles Accept/Reject/Ignore actions.
        If accepted, automatically follows the character.
        """
        stmt = select(FriendRequest).filter(
            FriendRequest.id == request_id,
            FriendRequest.user_id == user_id
        )
        result = await db.execute(stmt)
        req = result.scalars().first()
        
        if not req:
            return None
            
        if action == "accept":
            req.status = FriendRequestStatus.ACCEPTED.value
            # Auto-follow logic
            # Avoid circular import by doing raw insert or using stats_service if careful
            # Let's do a direct check and insert to be safe and fast
            existing_follow = await db.scalar(
                select(CharacterFollow).filter(
                    CharacterFollow.user_id == user_id,
                    CharacterFollow.character_id == req.character_id
                )
            )
            if not existing_follow:
                db.add(CharacterFollow(user_id=user_id, character_id=req.character_id))
                
        elif action == "reject":
            req.status = FriendRequestStatus.REJECTED.value
        elif action == "ignore":
            req.status = FriendRequestStatus.IGNORED.value
            
        db.add(req)
        await db.commit()
        await db.refresh(req)
        return req

    async def create_friend_request(
        self,
        db: AsyncSession,
        user_id: uuid.UUID,
        character_id: uuid.UUID,
        reason: str
    ) -> Optional[FriendRequest]:
        """
        Internal method to create a request.
        Checks if request already exists or if user is already following.
        """
        # 1. Check if already following
        is_following = await db.scalar(
            select(CharacterFollow).filter(
                CharacterFollow.user_id == user_id,
                CharacterFollow.character_id == character_id
            )
        )
        if is_following:
            return None

        # 2. Check if pending request exists
        existing_req = await db.scalar(
            select(FriendRequest).filter(
                FriendRequest.user_id == user_id,
                FriendRequest.character_id == character_id,
                FriendRequest.status == FriendRequestStatus.PENDING.value
            )
        )
        if existing_req:
            return existing_req

        # 3. Create
        req = FriendRequest(
            user_id=user_id,
            character_id=character_id,
            status=FriendRequestStatus.PENDING.value,
            reason=reason
        )
        db.add(req)
        await db.commit()
        logger.info(f"Created friend request for user {user_id} -> character {character_id} ({reason})")
        return req

    # --- Trigger / Rule Engine ---

    async def trigger_rules(self, db: AsyncSession, user_id: uuid.UUID, event_type: RecommendationEventType, context: dict):
        """
        Main entry point for triggering recommendations.
        event_type: RecommendationEventType
        """
        logger.info(f"Triggering recommendation rules: {event_type.value} for user {user_id}")
        
        try:
            if event_type == RecommendationEventType.CHAT_MILESTONE:
                # Context: character_id, turn_count
                await self._rule_tag_affinity(db, user_id, context.get("character_id"))
            
            elif event_type == RecommendationEventType.UNFOLLOW:
                # Context: character_id (the one deleted)
                await self._rule_churn_recovery(db, user_id, context.get("character_id"))
                
        except Exception as e:
            logger.error(f"Error in recommendation rules: {e}", exc_info=True)

    # --- Specific Rules ---

    async def _rule_tag_affinity(self, db: AsyncSession, user_id: uuid.UUID, source_character_id: uuid.UUID):
        """
        Scenario: User likes characters with Tag X.
        Action: Recommend another character with Tag X.
        """
        if not source_character_id:
            return

        # 1. Get tags of the source character
        source_char = await db.get(Character, source_character_id)
        if not source_char:
            return
            
        # Lazy load tags if not loaded (or ensure they are loaded)
        # Assuming tags are accessible. If strict async, might need query.
        stmt = select(Tag).join(CharacterTag, Tag.id == CharacterTag.c.tag_id).filter(CharacterTag.c.character_id == source_character_id)
        tags = (await db.execute(stmt)).scalars().all()
        
        if not tags:
            return
            
        # Pick the first tag for simplicity (or random)
        target_tag = tags[0]
        
        # 2. Find other characters with this tag, NOT followed by user
        subquery_followed = select(CharacterFollow.character_id).filter(CharacterFollow.user_id == user_id)
        
        stmt = (
            select(Character)
            .join(CharacterTag, Character.id == CharacterTag.c.character_id)
            .filter(
                CharacterTag.c.tag_id == target_tag.id,
                Character.id != source_character_id,
                Character.id.not_in(subquery_followed)
            )
            .limit(1) # Just one recommendation per trigger
        )
        
        candidate = (await db.execute(stmt)).scalars().first()
        
        if candidate:
            await self.create_friend_request(
                db, 
                user_id, 
                candidate.id, 
                reason=f"Because you like {target_tag.name} characters"
            )

    async def _rule_churn_recovery(self, db: AsyncSession, user_id: uuid.UUID, deleted_character_id: uuid.UUID):
        """
        Scenario: User unfollowed someone.
        Action: Recommend a 'Popular' character to keep them engaged.
        """
        # Simple logic: Recommend the character with most followers that the user doesn't follow
        subquery_followed = select(CharacterFollow.character_id).filter(CharacterFollow.user_id == user_id)
        
        # We need to join with CharacterStats to get follower_count, but let's assume simple ID order or random for now
        # to keep it lightweight if CharacterStats isn't strictly linked yet or complex.
        # Better: Pick a random character not followed.
        
        stmt = (
            select(Character)
            .filter(
                Character.id != deleted_character_id,
                Character.id.not_in(subquery_followed)
            )
            .order_by(func.random())
            .limit(1)
        )
        
        candidate = (await db.execute(stmt)).scalars().first()
        
        if candidate:
            await self.create_friend_request(
                db, 
                user_id, 
                candidate.id, 
                reason="You might like this character"
            )

recommendation_service = RecommendationService()
