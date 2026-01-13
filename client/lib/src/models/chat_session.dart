import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talker_client/src/models/character.dart';

part 'chat_session.freezed.dart';
part 'chat_session.g.dart';

@freezed
abstract class ChatSessionSettings with _$ChatSessionSettings {
  const factory ChatSessionSettings({
    @JsonKey(name: 'is_pinned') @Default(false) bool isPinned,
    @JsonKey(name: 'is_blocked') @Default(false) bool isBlocked,
    @JsonKey(name: 'allow_stickers') @Default(true) bool allowStickers,
    @JsonKey(name: 'allow_nudge') @Default(true) bool allowNudge,
    @JsonKey(name: 'allow_action_desc') @Default(true) bool allowActionDesc,
    @JsonKey(name: 'max_reply_tokens') @Default(100) int maxReplyTokens,
    @JsonKey(name: 'context_window_size') @Default(10) int contextWindowSize,
    @JsonKey(name: 'auto_summary_enabled') @Default(false) bool autoSummaryEnabled,
    @JsonKey(name: 'auto_summary_threshold') @Default(20) int autoSummaryThreshold,
  }) = _ChatSessionSettings;

  factory ChatSessionSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionSettingsFromJson(json);
}

@freezed
abstract class ChatSession with _$ChatSession {
  const factory ChatSession({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'character_id') required String characterId,
    Character? character,
    String? title,
    @Default("active") String status,
    @JsonKey(name: 'is_pinned') @Default(false) bool isPinned,
    
    // Settings & Summary
    String? summary,
    @JsonKey(name: 'summary_prompt') String? summaryPrompt,
    @JsonKey(name: 'background_image') String? backgroundImage,
    @Default(ChatSessionSettings()) ChatSessionSettings settings,
    
    @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
    @JsonKey(name: 'unread_count') @Default(0) int unreadCount,
    @JsonKey(name: 'msg_count') @Default(0) int msgCount,
    @JsonKey(name: 'token_usage') @Default(0) int tokenUsage,
    
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ChatSession;

  factory ChatSession.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionFromJson(json);
}

@freezed
abstract class ChatSessionUpdate with _$ChatSessionUpdate {
  const factory ChatSessionUpdate({
    String? title,
    String? status,
    @JsonKey(name: 'is_pinned') bool? isPinned,
    String? summary,
    @JsonKey(name: 'summary_prompt') String? summaryPrompt,
    @JsonKey(name: 'background_image') String? backgroundImage,
    ChatSessionSettings? settings,
  }) = _ChatSessionUpdate;

  factory ChatSessionUpdate.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionUpdateFromJson(json);
}
