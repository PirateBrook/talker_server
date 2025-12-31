// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterStats _$CharacterStatsFromJson(Map<String, dynamic> json) =>
    _CharacterStats(
      characterId: json['character_id'] as String,
      chatUserCount: (json['chat_user_count'] as num?)?.toInt() ?? 0,
      chatTurnCount: (json['chat_turn_count'] as num?)?.toInt() ?? 0,
      followerCount: (json['follower_count'] as num?)?.toInt() ?? 0,
      averageRating: (json['average_rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (json['rating_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CharacterStatsToJson(_CharacterStats instance) =>
    <String, dynamic>{
      'character_id': instance.characterId,
      'chat_user_count': instance.chatUserCount,
      'chat_turn_count': instance.chatTurnCount,
      'follower_count': instance.followerCount,
      'average_rating': instance.averageRating,
      'rating_count': instance.ratingCount,
    };

_RateCharacterRequest _$RateCharacterRequestFromJson(
        Map<String, dynamic> json) =>
    _RateCharacterRequest(
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$RateCharacterRequestToJson(
        _RateCharacterRequest instance) =>
    <String, dynamic>{
      'rating': instance.rating,
    };

_FollowCharacterResponse _$FollowCharacterResponseFromJson(
        Map<String, dynamic> json) =>
    _FollowCharacterResponse(
      success: json['success'] as bool,
      isFollowing: json['is_following'] as bool,
      followerCount: (json['follower_count'] as num).toInt(),
    );

Map<String, dynamic> _$FollowCharacterResponseToJson(
        _FollowCharacterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'is_following': instance.isFollowing,
      'follower_count': instance.followerCount,
    };
