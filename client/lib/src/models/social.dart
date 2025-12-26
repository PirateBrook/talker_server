import 'package:talker_client/src/models/character.dart';

class FriendItem {
  final Character character;
  final DateTime? lastInteractionAt;

  FriendItem({
    required this.character,
    this.lastInteractionAt,
  });

  factory FriendItem.fromJson(Map<String, dynamic> json) {
    return FriendItem(
      character: Character.fromJson(json['character']),
      lastInteractionAt: json['last_interaction_at'] != null
          ? DateTime.parse(json['last_interaction_at'])
          : null,
    );
  }
}

class MessageSessionItem {
  final String sessionId;
  final Character character;
  final String? lastMessagePreview;
  final int unreadCount;
  final DateTime updatedAt;
  final bool isPinned;

  MessageSessionItem({
    required this.sessionId,
    required this.character,
    this.lastMessagePreview,
    required this.unreadCount,
    required this.updatedAt,
    required this.isPinned,
  });

  factory MessageSessionItem.fromJson(Map<String, dynamic> json) {
    return MessageSessionItem(
      sessionId: json['session_id'],
      character: Character.fromJson(json['character']),
      lastMessagePreview: json['last_message_preview'],
      unreadCount: json['unread_count'] ?? 0,
      updatedAt: DateTime.parse(json['updated_at']),
      isPinned: json['is_pinned'] ?? false,
    );
  }
}
