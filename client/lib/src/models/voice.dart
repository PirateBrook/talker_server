import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice.freezed.dart';
part 'voice.g.dart';

@freezed
abstract class Voice with _$Voice {
  const factory Voice({
    required String id,
    required String name,
    required String category,
    String? description,
    @JsonKey(name: 'preview_url') String? previewUrl,
    required String provider,
  }) = _Voice;

  factory Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);
}

@freezed
abstract class VoiceList with _$VoiceList {
  const factory VoiceList({
    required List<Voice> voices,
  }) = _VoiceList;

  factory VoiceList.fromJson(Map<String, dynamic> json) => _$VoiceListFromJson(json);
}
