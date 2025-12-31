import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
abstract class Tag with _$Tag {
  const factory Tag({
    required int id,
    required String name,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

@freezed
abstract class DialogueSample with _$DialogueSample {
  const factory DialogueSample({
    required int id,
    @JsonKey(name: 'input_text') required String inputText,
    @JsonKey(name: 'output_text') required String outputText,
    @JsonKey(name: 'character_id') String? characterId,
  }) = _DialogueSample;

  factory DialogueSample.fromJson(Map<String, dynamic> json) => _$DialogueSampleFromJson(json);
}

@freezed
abstract class Character with _$Character {
  const factory Character({
    required String id,
    required String name,
    String? description,
    String? personality,
    String? backstory,
    @JsonKey(name: 'voice_style') String? voiceStyle,
    @JsonKey(name: 'interaction_preference') String? interactionPreference,
    @JsonKey(name: 'custom_attributes') Map<String, dynamic>? customAttributes,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @Default([]) List<Tag> tags,
    @JsonKey(name: 'dialogue_samples') @Default([]) List<DialogueSample> dialogueSamples,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => toJson();
}
