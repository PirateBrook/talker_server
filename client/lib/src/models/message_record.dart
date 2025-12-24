import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_record.freezed.dart';
part 'message_record.g.dart';

enum MessageContentType {
  @JsonValue('text')
  text,
  @JsonValue('image')
  image,
  @JsonValue('audio')
  audio,
  @JsonValue('video')
  video,
}

@freezed
abstract class MessageRecord with _$MessageRecord {
  const factory MessageRecord({
    required String id,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'character_id') required String characterId,
    required String role, // "user" | "ai" | "system"
    required String content,
    @JsonKey(name: 'content_type')
    @Default(MessageContentType.text)
    MessageContentType contentType,
    @JsonKey(name: 'action_type') String? actionType,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    Map<String, dynamic>? metadata,
  }) = _MessageRecord;

  factory MessageRecord.fromJson(Map<String, dynamic> json) =>
      _$MessageRecordFromJson(json);
}
