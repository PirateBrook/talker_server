// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tag _$TagFromJson(Map<String, dynamic> json) => _Tag(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TagToJson(_Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_DialogueSample _$DialogueSampleFromJson(Map<String, dynamic> json) =>
    _DialogueSample(
      id: (json['id'] as num).toInt(),
      inputText: json['input_text'] as String,
      outputText: json['output_text'] as String,
      characterId: json['character_id'] as String?,
    );

Map<String, dynamic> _$DialogueSampleToJson(_DialogueSample instance) =>
    <String, dynamic>{
      'id': instance.id,
      'input_text': instance.inputText,
      'output_text': instance.outputText,
      'character_id': instance.characterId,
    };

_Character _$CharacterFromJson(Map<String, dynamic> json) => _Character(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      personality: json['personality'] as String?,
      backstory: json['backstory'] as String?,
      voiceStyle: json['voice_style'] as String?,
      interactionPreference: json['interaction_preference'] as String?,
      customAttributes: json['custom_attributes'] as Map<String, dynamic>?,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dialogueSamples: (json['dialogue_samples'] as List<dynamic>?)
              ?.map((e) => DialogueSample.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CharacterToJson(_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'personality': instance.personality,
      'backstory': instance.backstory,
      'voice_style': instance.voiceStyle,
      'interaction_preference': instance.interactionPreference,
      'custom_attributes': instance.customAttributes,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'tags': instance.tags,
      'dialogue_samples': instance.dialogueSamples,
    };
