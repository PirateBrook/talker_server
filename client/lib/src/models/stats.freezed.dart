// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterStats {
  @JsonKey(name: 'character_id')
  String get characterId;
  @JsonKey(name: 'chat_user_count')
  int get chatUserCount;
  @JsonKey(name: 'chat_turn_count')
  int get chatTurnCount;
  @JsonKey(name: 'follower_count')
  int get followerCount;
  @JsonKey(name: 'average_rating')
  double get averageRating;
  @JsonKey(name: 'rating_count')
  int get ratingCount;

  /// Create a copy of CharacterStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharacterStatsCopyWith<CharacterStats> get copyWith =>
      _$CharacterStatsCopyWithImpl<CharacterStats>(
          this as CharacterStats, _$identity);

  /// Serializes this CharacterStats to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterStats &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.chatUserCount, chatUserCount) ||
                other.chatUserCount == chatUserCount) &&
            (identical(other.chatTurnCount, chatTurnCount) ||
                other.chatTurnCount == chatTurnCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, characterId, chatUserCount,
      chatTurnCount, followerCount, averageRating, ratingCount);

  @override
  String toString() {
    return 'CharacterStats(characterId: $characterId, chatUserCount: $chatUserCount, chatTurnCount: $chatTurnCount, followerCount: $followerCount, averageRating: $averageRating, ratingCount: $ratingCount)';
  }
}

/// @nodoc
abstract mixin class $CharacterStatsCopyWith<$Res> {
  factory $CharacterStatsCopyWith(
          CharacterStats value, $Res Function(CharacterStats) _then) =
      _$CharacterStatsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'character_id') String characterId,
      @JsonKey(name: 'chat_user_count') int chatUserCount,
      @JsonKey(name: 'chat_turn_count') int chatTurnCount,
      @JsonKey(name: 'follower_count') int followerCount,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'rating_count') int ratingCount});
}

/// @nodoc
class _$CharacterStatsCopyWithImpl<$Res>
    implements $CharacterStatsCopyWith<$Res> {
  _$CharacterStatsCopyWithImpl(this._self, this._then);

  final CharacterStats _self;
  final $Res Function(CharacterStats) _then;

  /// Create a copy of CharacterStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterId = null,
    Object? chatUserCount = null,
    Object? chatTurnCount = null,
    Object? followerCount = null,
    Object? averageRating = null,
    Object? ratingCount = null,
  }) {
    return _then(_self.copyWith(
      characterId: null == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      chatUserCount: null == chatUserCount
          ? _self.chatUserCount
          : chatUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      chatTurnCount: null == chatTurnCount
          ? _self.chatTurnCount
          : chatTurnCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _self.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CharacterStats].
extension CharacterStatsPatterns on CharacterStats {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CharacterStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CharacterStats() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CharacterStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CharacterStats():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CharacterStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CharacterStats() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'character_id') String characterId,
            @JsonKey(name: 'chat_user_count') int chatUserCount,
            @JsonKey(name: 'chat_turn_count') int chatTurnCount,
            @JsonKey(name: 'follower_count') int followerCount,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'rating_count') int ratingCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CharacterStats() when $default != null:
        return $default(
            _that.characterId,
            _that.chatUserCount,
            _that.chatTurnCount,
            _that.followerCount,
            _that.averageRating,
            _that.ratingCount);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'character_id') String characterId,
            @JsonKey(name: 'chat_user_count') int chatUserCount,
            @JsonKey(name: 'chat_turn_count') int chatTurnCount,
            @JsonKey(name: 'follower_count') int followerCount,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'rating_count') int ratingCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CharacterStats():
        return $default(
            _that.characterId,
            _that.chatUserCount,
            _that.chatTurnCount,
            _that.followerCount,
            _that.averageRating,
            _that.ratingCount);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'character_id') String characterId,
            @JsonKey(name: 'chat_user_count') int chatUserCount,
            @JsonKey(name: 'chat_turn_count') int chatTurnCount,
            @JsonKey(name: 'follower_count') int followerCount,
            @JsonKey(name: 'average_rating') double averageRating,
            @JsonKey(name: 'rating_count') int ratingCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CharacterStats() when $default != null:
        return $default(
            _that.characterId,
            _that.chatUserCount,
            _that.chatTurnCount,
            _that.followerCount,
            _that.averageRating,
            _that.ratingCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CharacterStats implements CharacterStats {
  const _CharacterStats(
      {@JsonKey(name: 'character_id') required this.characterId,
      @JsonKey(name: 'chat_user_count') this.chatUserCount = 0,
      @JsonKey(name: 'chat_turn_count') this.chatTurnCount = 0,
      @JsonKey(name: 'follower_count') this.followerCount = 0,
      @JsonKey(name: 'average_rating') this.averageRating = 0.0,
      @JsonKey(name: 'rating_count') this.ratingCount = 0});
  factory _CharacterStats.fromJson(Map<String, dynamic> json) =>
      _$CharacterStatsFromJson(json);

  @override
  @JsonKey(name: 'character_id')
  final String characterId;
  @override
  @JsonKey(name: 'chat_user_count')
  final int chatUserCount;
  @override
  @JsonKey(name: 'chat_turn_count')
  final int chatTurnCount;
  @override
  @JsonKey(name: 'follower_count')
  final int followerCount;
  @override
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @override
  @JsonKey(name: 'rating_count')
  final int ratingCount;

  /// Create a copy of CharacterStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacterStatsCopyWith<_CharacterStats> get copyWith =>
      __$CharacterStatsCopyWithImpl<_CharacterStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterStatsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterStats &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.chatUserCount, chatUserCount) ||
                other.chatUserCount == chatUserCount) &&
            (identical(other.chatTurnCount, chatTurnCount) ||
                other.chatTurnCount == chatTurnCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, characterId, chatUserCount,
      chatTurnCount, followerCount, averageRating, ratingCount);

  @override
  String toString() {
    return 'CharacterStats(characterId: $characterId, chatUserCount: $chatUserCount, chatTurnCount: $chatTurnCount, followerCount: $followerCount, averageRating: $averageRating, ratingCount: $ratingCount)';
  }
}

/// @nodoc
abstract mixin class _$CharacterStatsCopyWith<$Res>
    implements $CharacterStatsCopyWith<$Res> {
  factory _$CharacterStatsCopyWith(
          _CharacterStats value, $Res Function(_CharacterStats) _then) =
      __$CharacterStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'character_id') String characterId,
      @JsonKey(name: 'chat_user_count') int chatUserCount,
      @JsonKey(name: 'chat_turn_count') int chatTurnCount,
      @JsonKey(name: 'follower_count') int followerCount,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'rating_count') int ratingCount});
}

/// @nodoc
class __$CharacterStatsCopyWithImpl<$Res>
    implements _$CharacterStatsCopyWith<$Res> {
  __$CharacterStatsCopyWithImpl(this._self, this._then);

  final _CharacterStats _self;
  final $Res Function(_CharacterStats) _then;

  /// Create a copy of CharacterStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? characterId = null,
    Object? chatUserCount = null,
    Object? chatTurnCount = null,
    Object? followerCount = null,
    Object? averageRating = null,
    Object? ratingCount = null,
  }) {
    return _then(_CharacterStats(
      characterId: null == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      chatUserCount: null == chatUserCount
          ? _self.chatUserCount
          : chatUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      chatTurnCount: null == chatTurnCount
          ? _self.chatTurnCount
          : chatTurnCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _self.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$RateCharacterRequest {
  int get rating;

  /// Create a copy of RateCharacterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RateCharacterRequestCopyWith<RateCharacterRequest> get copyWith =>
      _$RateCharacterRequestCopyWithImpl<RateCharacterRequest>(
          this as RateCharacterRequest, _$identity);

  /// Serializes this RateCharacterRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RateCharacterRequest &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating);

  @override
  String toString() {
    return 'RateCharacterRequest(rating: $rating)';
  }
}

/// @nodoc
abstract mixin class $RateCharacterRequestCopyWith<$Res> {
  factory $RateCharacterRequestCopyWith(RateCharacterRequest value,
          $Res Function(RateCharacterRequest) _then) =
      _$RateCharacterRequestCopyWithImpl;
  @useResult
  $Res call({int rating});
}

/// @nodoc
class _$RateCharacterRequestCopyWithImpl<$Res>
    implements $RateCharacterRequestCopyWith<$Res> {
  _$RateCharacterRequestCopyWithImpl(this._self, this._then);

  final RateCharacterRequest _self;
  final $Res Function(RateCharacterRequest) _then;

  /// Create a copy of RateCharacterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
  }) {
    return _then(_self.copyWith(
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [RateCharacterRequest].
extension RateCharacterRequestPatterns on RateCharacterRequest {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RateCharacterRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateCharacterRequest() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RateCharacterRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateCharacterRequest():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RateCharacterRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateCharacterRequest() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int rating)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateCharacterRequest() when $default != null:
        return $default(_that.rating);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int rating) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateCharacterRequest():
        return $default(_that.rating);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int rating)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateCharacterRequest() when $default != null:
        return $default(_that.rating);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RateCharacterRequest implements RateCharacterRequest {
  const _RateCharacterRequest({required this.rating});
  factory _RateCharacterRequest.fromJson(Map<String, dynamic> json) =>
      _$RateCharacterRequestFromJson(json);

  @override
  final int rating;

  /// Create a copy of RateCharacterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RateCharacterRequestCopyWith<_RateCharacterRequest> get copyWith =>
      __$RateCharacterRequestCopyWithImpl<_RateCharacterRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RateCharacterRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RateCharacterRequest &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating);

  @override
  String toString() {
    return 'RateCharacterRequest(rating: $rating)';
  }
}

/// @nodoc
abstract mixin class _$RateCharacterRequestCopyWith<$Res>
    implements $RateCharacterRequestCopyWith<$Res> {
  factory _$RateCharacterRequestCopyWith(_RateCharacterRequest value,
          $Res Function(_RateCharacterRequest) _then) =
      __$RateCharacterRequestCopyWithImpl;
  @override
  @useResult
  $Res call({int rating});
}

/// @nodoc
class __$RateCharacterRequestCopyWithImpl<$Res>
    implements _$RateCharacterRequestCopyWith<$Res> {
  __$RateCharacterRequestCopyWithImpl(this._self, this._then);

  final _RateCharacterRequest _self;
  final $Res Function(_RateCharacterRequest) _then;

  /// Create a copy of RateCharacterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rating = null,
  }) {
    return _then(_RateCharacterRequest(
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$FollowCharacterResponse {
  bool get success;
  @JsonKey(name: 'is_following')
  bool get isFollowing;
  @JsonKey(name: 'follower_count')
  int get followerCount;

  /// Create a copy of FollowCharacterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowCharacterResponseCopyWith<FollowCharacterResponse> get copyWith =>
      _$FollowCharacterResponseCopyWithImpl<FollowCharacterResponse>(
          this as FollowCharacterResponse, _$identity);

  /// Serializes this FollowCharacterResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowCharacterResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, isFollowing, followerCount);

  @override
  String toString() {
    return 'FollowCharacterResponse(success: $success, isFollowing: $isFollowing, followerCount: $followerCount)';
  }
}

/// @nodoc
abstract mixin class $FollowCharacterResponseCopyWith<$Res> {
  factory $FollowCharacterResponseCopyWith(FollowCharacterResponse value,
          $Res Function(FollowCharacterResponse) _then) =
      _$FollowCharacterResponseCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'is_following') bool isFollowing,
      @JsonKey(name: 'follower_count') int followerCount});
}

/// @nodoc
class _$FollowCharacterResponseCopyWithImpl<$Res>
    implements $FollowCharacterResponseCopyWith<$Res> {
  _$FollowCharacterResponseCopyWithImpl(this._self, this._then);

  final FollowCharacterResponse _self;
  final $Res Function(FollowCharacterResponse) _then;

  /// Create a copy of FollowCharacterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? isFollowing = null,
    Object? followerCount = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _self.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FollowCharacterResponse].
extension FollowCharacterResponsePatterns on FollowCharacterResponse {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FollowCharacterResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowCharacterResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FollowCharacterResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowCharacterResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FollowCharacterResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowCharacterResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool success,
            @JsonKey(name: 'is_following') bool isFollowing,
            @JsonKey(name: 'follower_count') int followerCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowCharacterResponse() when $default != null:
        return $default(_that.success, _that.isFollowing, _that.followerCount);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool success,
            @JsonKey(name: 'is_following') bool isFollowing,
            @JsonKey(name: 'follower_count') int followerCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowCharacterResponse():
        return $default(_that.success, _that.isFollowing, _that.followerCount);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool success,
            @JsonKey(name: 'is_following') bool isFollowing,
            @JsonKey(name: 'follower_count') int followerCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowCharacterResponse() when $default != null:
        return $default(_that.success, _that.isFollowing, _that.followerCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowCharacterResponse implements FollowCharacterResponse {
  const _FollowCharacterResponse(
      {required this.success,
      @JsonKey(name: 'is_following') required this.isFollowing,
      @JsonKey(name: 'follower_count') required this.followerCount});
  factory _FollowCharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowCharacterResponseFromJson(json);

  @override
  final bool success;
  @override
  @JsonKey(name: 'is_following')
  final bool isFollowing;
  @override
  @JsonKey(name: 'follower_count')
  final int followerCount;

  /// Create a copy of FollowCharacterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowCharacterResponseCopyWith<_FollowCharacterResponse> get copyWith =>
      __$FollowCharacterResponseCopyWithImpl<_FollowCharacterResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FollowCharacterResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowCharacterResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, isFollowing, followerCount);

  @override
  String toString() {
    return 'FollowCharacterResponse(success: $success, isFollowing: $isFollowing, followerCount: $followerCount)';
  }
}

/// @nodoc
abstract mixin class _$FollowCharacterResponseCopyWith<$Res>
    implements $FollowCharacterResponseCopyWith<$Res> {
  factory _$FollowCharacterResponseCopyWith(_FollowCharacterResponse value,
          $Res Function(_FollowCharacterResponse) _then) =
      __$FollowCharacterResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'is_following') bool isFollowing,
      @JsonKey(name: 'follower_count') int followerCount});
}

/// @nodoc
class __$FollowCharacterResponseCopyWithImpl<$Res>
    implements _$FollowCharacterResponseCopyWith<$Res> {
  __$FollowCharacterResponseCopyWithImpl(this._self, this._then);

  final _FollowCharacterResponse _self;
  final $Res Function(_FollowCharacterResponse) _then;

  /// Create a copy of FollowCharacterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? isFollowing = null,
    Object? followerCount = null,
  }) {
    return _then(_FollowCharacterResponse(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _self.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
