// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendItem _$FriendItemFromJson(Map<String, dynamic> json) => _FriendItem(
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
      lastInteractionAt: json['last_interaction_at'] == null
          ? null
          : DateTime.parse(json['last_interaction_at'] as String),
    );

Map<String, dynamic> _$FriendItemToJson(_FriendItem instance) =>
    <String, dynamic>{
      'character': instance.character,
      'last_interaction_at': instance.lastInteractionAt?.toIso8601String(),
    };

_MessageSessionItem _$MessageSessionItemFromJson(Map<String, dynamic> json) =>
    _MessageSessionItem(
      sessionId: json['session_id'] as String,
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
      lastMessagePreview: json['last_message_preview'] as String?,
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isPinned: json['is_pinned'] as bool? ?? false,
    );

Map<String, dynamic> _$MessageSessionItemToJson(_MessageSessionItem instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'character': instance.character,
      'last_message_preview': instance.lastMessagePreview,
      'unread_count': instance.unreadCount,
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_pinned': instance.isPinned,
    };

_FriendRequestItem _$FriendRequestItemFromJson(Map<String, dynamic> json) =>
    _FriendRequestItem(
      id: (json['id'] as num).toInt(),
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
      status: json['status'] as String,
      reason: json['reason'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$FriendRequestItemToJson(_FriendRequestItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'character': instance.character,
      'status': instance.status,
      'reason': instance.reason,
      'created_at': instance.createdAt.toIso8601String(),
    };

_FriendRequestAction _$FriendRequestActionFromJson(Map<String, dynamic> json) =>
    _FriendRequestAction(
      action: json['action'] as String,
    );

Map<String, dynamic> _$FriendRequestActionToJson(
        _FriendRequestAction instance) =>
    <String, dynamic>{
      'action': instance.action,
    };
