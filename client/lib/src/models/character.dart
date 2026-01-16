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
  Map<String, dynamic> toJson() => toJson();
}

@freezed
abstract class DialogueSample with _$DialogueSample {
  const factory DialogueSample({
    required int id,
    @JsonKey(name: 'input_text') required String inputText,
    @JsonKey(name: 'output_text') required String outputText,
    @JsonKey(name: 'character_id') String? characterId,
  }) = _DialogueSample;

  factory DialogueSample.fromJson(Map<String, dynamic> json) =>
      _$DialogueSampleFromJson(json);
  Map<String, dynamic> toJson() => toJson();
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
    // New Fields
    String? gender,
    String? avatar,
    @JsonKey(name: 'expression_style') String? expressionStyle,
    @Default([]) List<String> catchphrases,
    @JsonKey(name: 'prompt_template') String? promptTemplate,
    @JsonKey(name: 'default_voice_id') String? defaultVoiceId,
    @JsonKey(name: 'custom_attributes') Map<String, dynamic>? customAttributes,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @Default([]) List<Tag> tags,
    @JsonKey(name: 'dialogue_samples')
    @Default([])
    List<DialogueSample> dialogueSamples,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() {
    // Cast to concrete implementation to satisfy freezed generated toJson
    final json = (this as _Character).toJson();
    // Server expects tags as list of strings (names) for updates/creates
    if (json['tags'] is List) {
      json['tags'] = tags.map((t) => t.name).toList();
    }
    return json;
  }
}

extension CharacterExtension on Character {
  // Getters
  int? get age => customAttributes?['age'] as int?;
  String? get height => customAttributes?['height'] as String?;
  String? get archetype => customAttributes?['archetype'] as String?;
  String? get hobby => customAttributes?['hobby'] as String?;
  String? get source => customAttributes?['source'] as String?;
  String? get dataVersion => customAttributes?['data_version'] as String?;

  // CopyWith helpers (Since Character is immutable and freezed, we typically use copyWith from freezed)
  // However, updating nested customAttributes is tricky with standard copyWith.
  // We can provide a helper to update specific custom attributes.
  Character updateCustomAttribute(String key, dynamic value) {
    final currentAttributes = Map<String, dynamic>.from(customAttributes ?? {});
    currentAttributes[key] = value;
    return copyWith(customAttributes: currentAttributes);
  }
}
