// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageRecord _$MessageRecordFromJson(Map<String, dynamic> json) =>
    _MessageRecord(
      id: json['id'] as String,
      sessionId: json['session_id'] as String,
      userId: json['user_id'] as String,
      characterId: json['character_id'] as String,
      role: json['role'] as String,
      content: json['content'] as String,
      contentType: $enumDecodeNullable(
              _$MessageContentTypeEnumMap, json['content_type']) ??
          MessageContentType.text,
      actionType: json['action_type'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MessageRecordToJson(_MessageRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'user_id': instance.userId,
      'character_id': instance.characterId,
      'role': instance.role,
      'content': instance.content,
      'content_type': _$MessageContentTypeEnumMap[instance.contentType]!,
      'action_type': instance.actionType,
      'created_at': instance.createdAt.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$MessageContentTypeEnumMap = {
  MessageContentType.text: 'text',
  MessageContentType.image: 'image',
  MessageContentType.audio: 'audio',
  MessageContentType.video: 'video',
};
