// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterMemory _$CharacterMemoryFromJson(Map<String, dynamic> json) =>
    _CharacterMemory(
      id: (json['id'] as num).toInt(),
      characterId: json['character_id'] as String,
      userId: json['user_id'] as String?,
      sourceMessageId: json['source_message_id'] as String?,
      content: json['content'] as String,
      isManual: json['is_manual'] as bool? ?? false,
    );

Map<String, dynamic> _$CharacterMemoryToJson(_CharacterMemory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'character_id': instance.characterId,
      'user_id': instance.userId,
      'source_message_id': instance.sourceMessageId,
      'content': instance.content,
      'is_manual': instance.isManual,
    };

_MemoryCreate _$MemoryCreateFromJson(Map<String, dynamic> json) =>
    _MemoryCreate(
      content: json['content'] as String,
      isManual: json['is_manual'] as bool? ?? false,
    );

Map<String, dynamic> _$MemoryCreateToJson(_MemoryCreate instance) =>
    <String, dynamic>{
      'content': instance.content,
      'is_manual': instance.isManual,
    };
