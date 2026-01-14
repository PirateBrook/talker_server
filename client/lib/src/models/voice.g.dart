// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Voice _$VoiceFromJson(Map<String, dynamic> json) => _Voice(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String?,
      previewUrl: json['preview_url'] as String?,
      provider: json['provider'] as String,
    );

Map<String, dynamic> _$VoiceToJson(_Voice instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'preview_url': instance.previewUrl,
      'provider': instance.provider,
    };

_VoiceList _$VoiceListFromJson(Map<String, dynamic> json) => _VoiceList(
      voices: (json['voices'] as List<dynamic>)
          .map((e) => Voice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VoiceListToJson(_VoiceList instance) =>
    <String, dynamic>{
      'voices': instance.voices,
    };
