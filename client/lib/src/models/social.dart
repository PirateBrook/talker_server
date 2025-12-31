import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talker_client/src/models/character.dart';

part 'social.freezed.dart';
part 'social.g.dart';

@freezed
abstract class FriendItem with _$FriendItem {
  const factory FriendItem({
    required Character character,
    @JsonKey(name: 'last_interaction_at') DateTime? lastInteractionAt,
  }) = _FriendItem;

  factory FriendItem.fromJson(Map<String, dynamic> json) =>
      _$FriendItemFromJson(json);
}

@freezed
abstract class MessageSessionItem with _$MessageSessionItem {
  const factory MessageSessionItem({
    @JsonKey(name: 'session_id') required String sessionId,
    required Character character,
    @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
    @JsonKey(name: 'unread_count') @Default(0) int unreadCount,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'is_pinned') @Default(false) bool isPinned,
  }) = _MessageSessionItem;

  factory MessageSessionItem.fromJson(Map<String, dynamic> json) =>
      _$MessageSessionItemFromJson(json);
}

@freezed
abstract class FriendRequestItem with _$FriendRequestItem {
  const factory FriendRequestItem({
    required int id,
    required Character character,
    required String status,
    String? reason,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _FriendRequestItem;

  factory FriendRequestItem.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestItemFromJson(json);
}

@freezed
abstract class FriendRequestAction with _$FriendRequestAction {
  const factory FriendRequestAction({
    required String action,
  }) = _FriendRequestAction;

  factory FriendRequestAction.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestActionFromJson(json);
}
