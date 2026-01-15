// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatSessionSettings _$ChatSessionSettingsFromJson(Map<String, dynamic> json) =>
    _ChatSessionSettings(
      isPinned: json['is_pinned'] as bool? ?? false,
      isBlocked: json['is_blocked'] as bool? ?? false,
      allowStickers: json['allow_stickers'] as bool? ?? true,
      allowNudge: json['allow_nudge'] as bool? ?? true,
      allowActionDesc: json['allow_action_desc'] as bool? ?? true,
      maxReplyTokens: (json['max_reply_tokens'] as num?)?.toInt() ?? 100,
      contextWindowSize: (json['context_window_size'] as num?)?.toInt() ?? 10,
      autoSummaryEnabled: json['auto_summary_enabled'] as bool? ?? false,
      autoSummaryThreshold:
          (json['auto_summary_threshold'] as num?)?.toInt() ?? 20,
      voiceReplyFrequency:
          json['voice_reply_frequency'] as String? ?? 'occasionally',
    );

Map<String, dynamic> _$ChatSessionSettingsToJson(
        _ChatSessionSettings instance) =>
    <String, dynamic>{
      'is_pinned': instance.isPinned,
      'is_blocked': instance.isBlocked,
      'allow_stickers': instance.allowStickers,
      'allow_nudge': instance.allowNudge,
      'allow_action_desc': instance.allowActionDesc,
      'max_reply_tokens': instance.maxReplyTokens,
      'context_window_size': instance.contextWindowSize,
      'auto_summary_enabled': instance.autoSummaryEnabled,
      'auto_summary_threshold': instance.autoSummaryThreshold,
      'voice_reply_frequency': instance.voiceReplyFrequency,
    };

_ChatSession _$ChatSessionFromJson(Map<String, dynamic> json) => _ChatSession(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      characterId: json['character_id'] as String,
      character: json['character'] == null
          ? null
          : Character.fromJson(json['character'] as Map<String, dynamic>),
      title: json['title'] as String?,
      status: json['status'] as String? ?? "active",
      isPinned: json['is_pinned'] as bool? ?? false,
      summary: json['summary'] as String?,
      summaryPrompt: json['summary_prompt'] as String?,
      backgroundImage: json['background_image'] as String?,
      settings: json['settings'] == null
          ? const ChatSessionSettings()
          : ChatSessionSettings.fromJson(
              json['settings'] as Map<String, dynamic>),
      lastMessagePreview: json['last_message_preview'] as String?,
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      msgCount: (json['msg_count'] as num?)?.toInt() ?? 0,
      tokenUsage: (json['token_usage'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ChatSessionToJson(_ChatSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'character_id': instance.characterId,
      'character': instance.character,
      'title': instance.title,
      'status': instance.status,
      'is_pinned': instance.isPinned,
      'summary': instance.summary,
      'summary_prompt': instance.summaryPrompt,
      'background_image': instance.backgroundImage,
      'settings': instance.settings,
      'last_message_preview': instance.lastMessagePreview,
      'unread_count': instance.unreadCount,
      'msg_count': instance.msgCount,
      'token_usage': instance.tokenUsage,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_ChatSessionUpdate _$ChatSessionUpdateFromJson(Map<String, dynamic> json) =>
    _ChatSessionUpdate(
      title: json['title'] as String?,
      status: json['status'] as String?,
      isPinned: json['is_pinned'] as bool?,
      summary: json['summary'] as String?,
      summaryPrompt: json['summary_prompt'] as String?,
      backgroundImage: json['background_image'] as String?,
      settings: json['settings'] == null
          ? null
          : ChatSessionSettings.fromJson(
              json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatSessionUpdateToJson(_ChatSessionUpdate instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
      'is_pinned': instance.isPinned,
      'summary': instance.summary,
      'summary_prompt': instance.summaryPrompt,
      'background_image': instance.backgroundImage,
      'settings': instance.settings,
    };
