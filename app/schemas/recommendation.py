from enum import Enum

class RecommendationEventType(str, Enum):
    CHAT_MILESTONE = "chat_milestone"
    UNFOLLOW = "unfollow"
    LOGIN = "login"
