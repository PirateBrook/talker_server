import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory.freezed.dart';
part 'memory.g.dart';

@freezed
abstract class CharacterMemory with _$CharacterMemory {
  const factory CharacterMemory({
    required int id,
    @JsonKey(name: 'character_id') required String characterId,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'source_message_id') String? sourceMessageId,
    required String content,
    @JsonKey(name: 'is_manual') @Default(false) bool isManual,
  }) = _CharacterMemory;

  factory CharacterMemory.fromJson(Map<String, dynamic> json) =>
      _$CharacterMemoryFromJson(json);
}

@freezed
abstract class MemoryCreate with _$MemoryCreate {
  const factory MemoryCreate({
    required String content,
    @JsonKey(name: 'is_manual') @Default(false) bool isManual,
  }) = _MemoryCreate;

  factory MemoryCreate.fromJson(Map<String, dynamic> json) =>
      _$MemoryCreateFromJson(json);

  toJson() => toJson();
}
