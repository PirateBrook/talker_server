import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
abstract class CharacterStats with _$CharacterStats {
  const factory CharacterStats({
    @JsonKey(name: 'character_id') required String characterId,
    @JsonKey(name: 'chat_user_count') @Default(0) int chatUserCount,
    @JsonKey(name: 'chat_turn_count') @Default(0) int chatTurnCount,
    @JsonKey(name: 'follower_count') @Default(0) int followerCount,
    @JsonKey(name: 'average_rating') @Default(0.0) double averageRating,
    @JsonKey(name: 'rating_count') @Default(0) int ratingCount,
  }) = _CharacterStats;

  factory CharacterStats.fromJson(Map<String, dynamic> json) =>
      _$CharacterStatsFromJson(json);
}

@freezed
abstract class RateCharacterRequest with _$RateCharacterRequest {
  const factory RateCharacterRequest({
    required int rating,
  }) = _RateCharacterRequest;

  factory RateCharacterRequest.fromJson(Map<String, dynamic> json) =>
      _$RateCharacterRequestFromJson(json);

  toJson() => toJson();
}

@freezed
abstract class FollowCharacterResponse with _$FollowCharacterResponse {
  const factory FollowCharacterResponse({
    required bool success,
    @JsonKey(name: 'is_following') required bool isFollowing,
    @JsonKey(name: 'follower_count') required int followerCount,
  }) = _FollowCharacterResponse;

  factory FollowCharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowCharacterResponseFromJson(json);
}
