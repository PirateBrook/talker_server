// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendItem {
  Character get character;
  @JsonKey(name: 'last_interaction_at')
  DateTime? get lastInteractionAt;

  /// Create a copy of FriendItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FriendItemCopyWith<FriendItem> get copyWith =>
      _$FriendItemCopyWithImpl<FriendItem>(this as FriendItem, _$identity);

  /// Serializes this FriendItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FriendItem &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.lastInteractionAt, lastInteractionAt) ||
                other.lastInteractionAt == lastInteractionAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, character, lastInteractionAt);

  @override
  String toString() {
    return 'FriendItem(character: $character, lastInteractionAt: $lastInteractionAt)';
  }
}

/// @nodoc
abstract mixin class $FriendItemCopyWith<$Res> {
  factory $FriendItemCopyWith(
          FriendItem value, $Res Function(FriendItem) _then) =
      _$FriendItemCopyWithImpl;
  @useResult
  $Res call(
      {Character character,
      @JsonKey(name: 'last_interaction_at') DateTime? lastInteractionAt});

  $CharacterCopyWith<$Res> get character;
}

/// @nodoc
class _$FriendItemCopyWithImpl<$Res> implements $FriendItemCopyWith<$Res> {
  _$FriendItemCopyWithImpl(this._self, this._then);

  final FriendItem _self;
  final $Res Function(FriendItem) _then;

  /// Create a copy of FriendItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? lastInteractionAt = freezed,
  }) {
    return _then(_self.copyWith(
      character: null == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      lastInteractionAt: freezed == lastInteractionAt
          ? _self.lastInteractionAt
          : lastInteractionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of FriendItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get character {
    return $CharacterCopyWith<$Res>(_self.character, (value) {
      return _then(_self.copyWith(character: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FriendItem].
extension FriendItemPatterns on FriendItem {
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
    TResult Function(_FriendItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FriendItem() when $default != null:
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
    TResult Function(_FriendItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendItem():
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
    TResult? Function(_FriendItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendItem() when $default != null:
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
    TResult Function(Character character,
            @JsonKey(name: 'last_interaction_at') DateTime? lastInteractionAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FriendItem() when $default != null:
        return $default(_that.character, _that.lastInteractionAt);
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
    TResult Function(Character character,
            @JsonKey(name: 'last_interaction_at') DateTime? lastInteractionAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendItem():
        return $default(_that.character, _that.lastInteractionAt);
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
    TResult? Function(Character character,
            @JsonKey(name: 'last_interaction_at') DateTime? lastInteractionAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendItem() when $default != null:
        return $default(_that.character, _that.lastInteractionAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FriendItem implements FriendItem {
  const _FriendItem(
      {required this.character,
      @JsonKey(name: 'last_interaction_at') this.lastInteractionAt});
  factory _FriendItem.fromJson(Map<String, dynamic> json) =>
      _$FriendItemFromJson(json);

  @override
  final Character character;
  @override
  @JsonKey(name: 'last_interaction_at')
  final DateTime? lastInteractionAt;

  /// Create a copy of FriendItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FriendItemCopyWith<_FriendItem> get copyWith =>
      __$FriendItemCopyWithImpl<_FriendItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FriendItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendItem &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.lastInteractionAt, lastInteractionAt) ||
                other.lastInteractionAt == lastInteractionAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, character, lastInteractionAt);

  @override
  String toString() {
    return 'FriendItem(character: $character, lastInteractionAt: $lastInteractionAt)';
  }
}

/// @nodoc
abstract mixin class _$FriendItemCopyWith<$Res>
    implements $FriendItemCopyWith<$Res> {
  factory _$FriendItemCopyWith(
          _FriendItem value, $Res Function(_FriendItem) _then) =
      __$FriendItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Character character,
      @JsonKey(name: 'last_interaction_at') DateTime? lastInteractionAt});

  @override
  $CharacterCopyWith<$Res> get character;
}

/// @nodoc
class __$FriendItemCopyWithImpl<$Res> implements _$FriendItemCopyWith<$Res> {
  __$FriendItemCopyWithImpl(this._self, this._then);

  final _FriendItem _self;
  final $Res Function(_FriendItem) _then;

  /// Create a copy of FriendItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? character = null,
    Object? lastInteractionAt = freezed,
  }) {
    return _then(_FriendItem(
      character: null == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      lastInteractionAt: freezed == lastInteractionAt
          ? _self.lastInteractionAt
          : lastInteractionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of FriendItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get character {
    return $CharacterCopyWith<$Res>(_self.character, (value) {
      return _then(_self.copyWith(character: value));
    });
  }
}

/// @nodoc
mixin _$MessageSessionItem {
  @JsonKey(name: 'session_id')
  String get sessionId;
  Character get character;
  @JsonKey(name: 'last_message_preview')
  String? get lastMessagePreview;
  @JsonKey(name: 'unread_count')
  int get unreadCount;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @JsonKey(name: 'is_pinned')
  bool get isPinned;

  /// Create a copy of MessageSessionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageSessionItemCopyWith<MessageSessionItem> get copyWith =>
      _$MessageSessionItemCopyWithImpl<MessageSessionItem>(
          this as MessageSessionItem, _$identity);

  /// Serializes this MessageSessionItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageSessionItem &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.lastMessagePreview, lastMessagePreview) ||
                other.lastMessagePreview == lastMessagePreview) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, character,
      lastMessagePreview, unreadCount, updatedAt, isPinned);

  @override
  String toString() {
    return 'MessageSessionItem(sessionId: $sessionId, character: $character, lastMessagePreview: $lastMessagePreview, unreadCount: $unreadCount, updatedAt: $updatedAt, isPinned: $isPinned)';
  }
}

/// @nodoc
abstract mixin class $MessageSessionItemCopyWith<$Res> {
  factory $MessageSessionItemCopyWith(
          MessageSessionItem value, $Res Function(MessageSessionItem) _then) =
      _$MessageSessionItemCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'session_id') String sessionId,
      Character character,
      @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
      @JsonKey(name: 'unread_count') int unreadCount,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_pinned') bool isPinned});

  $CharacterCopyWith<$Res> get character;
}

/// @nodoc
class _$MessageSessionItemCopyWithImpl<$Res>
    implements $MessageSessionItemCopyWith<$Res> {
  _$MessageSessionItemCopyWithImpl(this._self, this._then);

  final MessageSessionItem _self;
  final $Res Function(MessageSessionItem) _then;

  /// Create a copy of MessageSessionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? character = null,
    Object? lastMessagePreview = freezed,
    Object? unreadCount = null,
    Object? updatedAt = null,
    Object? isPinned = null,
  }) {
    return _then(_self.copyWith(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      lastMessagePreview: freezed == lastMessagePreview
          ? _self.lastMessagePreview
          : lastMessagePreview // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of MessageSessionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get character {
    return $CharacterCopyWith<$Res>(_self.character, (value) {
      return _then(_self.copyWith(character: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MessageSessionItem].
extension MessageSessionItemPatterns on MessageSessionItem {
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
    TResult Function(_MessageSessionItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageSessionItem() when $default != null:
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
    TResult Function(_MessageSessionItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSessionItem():
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
    TResult? Function(_MessageSessionItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSessionItem() when $default != null:
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
            @JsonKey(name: 'session_id') String sessionId,
            Character character,
            @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
            @JsonKey(name: 'unread_count') int unreadCount,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            @JsonKey(name: 'is_pinned') bool isPinned)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageSessionItem() when $default != null:
        return $default(
            _that.sessionId,
            _that.character,
            _that.lastMessagePreview,
            _that.unreadCount,
            _that.updatedAt,
            _that.isPinned);
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
            @JsonKey(name: 'session_id') String sessionId,
            Character character,
            @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
            @JsonKey(name: 'unread_count') int unreadCount,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            @JsonKey(name: 'is_pinned') bool isPinned)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSessionItem():
        return $default(
            _that.sessionId,
            _that.character,
            _that.lastMessagePreview,
            _that.unreadCount,
            _that.updatedAt,
            _that.isPinned);
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
            @JsonKey(name: 'session_id') String sessionId,
            Character character,
            @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
            @JsonKey(name: 'unread_count') int unreadCount,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            @JsonKey(name: 'is_pinned') bool isPinned)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSessionItem() when $default != null:
        return $default(
            _that.sessionId,
            _that.character,
            _that.lastMessagePreview,
            _that.unreadCount,
            _that.updatedAt,
            _that.isPinned);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MessageSessionItem implements MessageSessionItem {
  const _MessageSessionItem(
      {@JsonKey(name: 'session_id') required this.sessionId,
      required this.character,
      @JsonKey(name: 'last_message_preview') this.lastMessagePreview,
      @JsonKey(name: 'unread_count') this.unreadCount = 0,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'is_pinned') this.isPinned = false});
  factory _MessageSessionItem.fromJson(Map<String, dynamic> json) =>
      _$MessageSessionItemFromJson(json);

  @override
  @JsonKey(name: 'session_id')
  final String sessionId;
  @override
  final Character character;
  @override
  @JsonKey(name: 'last_message_preview')
  final String? lastMessagePreview;
  @override
  @JsonKey(name: 'unread_count')
  final int unreadCount;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'is_pinned')
  final bool isPinned;

  /// Create a copy of MessageSessionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageSessionItemCopyWith<_MessageSessionItem> get copyWith =>
      __$MessageSessionItemCopyWithImpl<_MessageSessionItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageSessionItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageSessionItem &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.lastMessagePreview, lastMessagePreview) ||
                other.lastMessagePreview == lastMessagePreview) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, character,
      lastMessagePreview, unreadCount, updatedAt, isPinned);

  @override
  String toString() {
    return 'MessageSessionItem(sessionId: $sessionId, character: $character, lastMessagePreview: $lastMessagePreview, unreadCount: $unreadCount, updatedAt: $updatedAt, isPinned: $isPinned)';
  }
}

/// @nodoc
abstract mixin class _$MessageSessionItemCopyWith<$Res>
    implements $MessageSessionItemCopyWith<$Res> {
  factory _$MessageSessionItemCopyWith(
          _MessageSessionItem value, $Res Function(_MessageSessionItem) _then) =
      __$MessageSessionItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'session_id') String sessionId,
      Character character,
      @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
      @JsonKey(name: 'unread_count') int unreadCount,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_pinned') bool isPinned});

  @override
  $CharacterCopyWith<$Res> get character;
}

/// @nodoc
class __$MessageSessionItemCopyWithImpl<$Res>
    implements _$MessageSessionItemCopyWith<$Res> {
  __$MessageSessionItemCopyWithImpl(this._self, this._then);

  final _MessageSessionItem _self;
  final $Res Function(_MessageSessionItem) _then;

  /// Create a copy of MessageSessionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? character = null,
    Object? lastMessagePreview = freezed,
    Object? unreadCount = null,
    Object? updatedAt = null,
    Object? isPinned = null,
  }) {
    return _then(_MessageSessionItem(
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      lastMessagePreview: freezed == lastMessagePreview
          ? _self.lastMessagePreview
          : lastMessagePreview // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPinned: null == isPinned
          ? _self.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of MessageSessionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get character {
    return $CharacterCopyWith<$Res>(_self.character, (value) {
      return _then(_self.copyWith(character: value));
    });
  }
}

/// @nodoc
mixin _$FriendRequestItem {
  int get id;
  Character get character;
  String get status;
  String? get reason;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of FriendRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FriendRequestItemCopyWith<FriendRequestItem> get copyWith =>
      _$FriendRequestItemCopyWithImpl<FriendRequestItem>(
          this as FriendRequestItem, _$identity);

  /// Serializes this FriendRequestItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FriendRequestItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, character, status, reason, createdAt);

  @override
  String toString() {
    return 'FriendRequestItem(id: $id, character: $character, status: $status, reason: $reason, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $FriendRequestItemCopyWith<$Res> {
  factory $FriendRequestItemCopyWith(
          FriendRequestItem value, $Res Function(FriendRequestItem) _then) =
      _$FriendRequestItemCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      Character character,
      String status,
      String? reason,
      @JsonKey(name: 'created_at') DateTime createdAt});

  $CharacterCopyWith<$Res> get character;
}

/// @nodoc
class _$FriendRequestItemCopyWithImpl<$Res>
    implements $FriendRequestItemCopyWith<$Res> {
  _$FriendRequestItemCopyWithImpl(this._self, this._then);

  final FriendRequestItem _self;
  final $Res Function(FriendRequestItem) _then;

  /// Create a copy of FriendRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? character = null,
    Object? status = null,
    Object? reason = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      character: null == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of FriendRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get character {
    return $CharacterCopyWith<$Res>(_self.character, (value) {
      return _then(_self.copyWith(character: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FriendRequestItem].
extension FriendRequestItemPatterns on FriendRequestItem {
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
    TResult Function(_FriendRequestItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FriendRequestItem() when $default != null:
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
    TResult Function(_FriendRequestItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendRequestItem():
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
    TResult? Function(_FriendRequestItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendRequestItem() when $default != null:
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
    TResult Function(int id, Character character, String status, String? reason,
            @JsonKey(name: 'created_at') DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FriendRequestItem() when $default != null:
        return $default(_that.id, _that.character, _that.status, _that.reason,
            _that.createdAt);
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
    TResult Function(int id, Character character, String status, String? reason,
            @JsonKey(name: 'created_at') DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendRequestItem():
        return $default(_that.id, _that.character, _that.status, _that.reason,
            _that.createdAt);
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
    TResult? Function(int id, Character character, String status,
            String? reason, @JsonKey(name: 'created_at') DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendRequestItem() when $default != null:
        return $default(_that.id, _that.character, _that.status, _that.reason,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FriendRequestItem implements FriendRequestItem {
  const _FriendRequestItem(
      {required this.id,
      required this.character,
      required this.status,
      this.reason,
      @JsonKey(name: 'created_at') required this.createdAt});
  factory _FriendRequestItem.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestItemFromJson(json);

  @override
  final int id;
  @override
  final Character character;
  @override
  final String status;
  @override
  final String? reason;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  /// Create a copy of FriendRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FriendRequestItemCopyWith<_FriendRequestItem> get copyWith =>
      __$FriendRequestItemCopyWithImpl<_FriendRequestItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FriendRequestItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendRequestItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, character, status, reason, createdAt);

  @override
  String toString() {
    return 'FriendRequestItem(id: $id, character: $character, status: $status, reason: $reason, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$FriendRequestItemCopyWith<$Res>
    implements $FriendRequestItemCopyWith<$Res> {
  factory _$FriendRequestItemCopyWith(
          _FriendRequestItem value, $Res Function(_FriendRequestItem) _then) =
      __$FriendRequestItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      Character character,
      String status,
      String? reason,
      @JsonKey(name: 'created_at') DateTime createdAt});

  @override
  $CharacterCopyWith<$Res> get character;
}

/// @nodoc
class __$FriendRequestItemCopyWithImpl<$Res>
    implements _$FriendRequestItemCopyWith<$Res> {
  __$FriendRequestItemCopyWithImpl(this._self, this._then);

  final _FriendRequestItem _self;
  final $Res Function(_FriendRequestItem) _then;

  /// Create a copy of FriendRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? character = null,
    Object? status = null,
    Object? reason = freezed,
    Object? createdAt = null,
  }) {
    return _then(_FriendRequestItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      character: null == character
          ? _self.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of FriendRequestItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get character {
    return $CharacterCopyWith<$Res>(_self.character, (value) {
      return _then(_self.copyWith(character: value));
    });
  }
}

/// @nodoc
mixin _$FriendRequestAction {
  String get action;

  /// Create a copy of FriendRequestAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FriendRequestActionCopyWith<FriendRequestAction> get copyWith =>
      _$FriendRequestActionCopyWithImpl<FriendRequestAction>(
          this as FriendRequestAction, _$identity);

  /// Serializes this FriendRequestAction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FriendRequestAction &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action);

  @override
  String toString() {
    return 'FriendRequestAction(action: $action)';
  }
}

/// @nodoc
abstract mixin class $FriendRequestActionCopyWith<$Res> {
  factory $FriendRequestActionCopyWith(
          FriendRequestAction value, $Res Function(FriendRequestAction) _then) =
      _$FriendRequestActionCopyWithImpl;
  @useResult
  $Res call({String action});
}

/// @nodoc
class _$FriendRequestActionCopyWithImpl<$Res>
    implements $FriendRequestActionCopyWith<$Res> {
  _$FriendRequestActionCopyWithImpl(this._self, this._then);

  final FriendRequestAction _self;
  final $Res Function(FriendRequestAction) _then;

  /// Create a copy of FriendRequestAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_self.copyWith(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [FriendRequestAction].
extension FriendRequestActionPatterns on FriendRequestAction {
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
    TResult Function(_FriendRequestAction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FriendRequestAction() when $default != null:
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
    TResult Function(_FriendRequestAction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendRequestAction():
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
    TResult? Function(_FriendRequestAction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendRequestAction() when $default != null:
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
    TResult Function(String action)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FriendRequestAction() when $default != null:
        return $default(_that.action);
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
    TResult Function(String action) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendRequestAction():
        return $default(_that.action);
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
    TResult? Function(String action)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FriendRequestAction() when $default != null:
        return $default(_that.action);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FriendRequestAction implements FriendRequestAction {
  const _FriendRequestAction({required this.action});
  factory _FriendRequestAction.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestActionFromJson(json);

  @override
  final String action;

  /// Create a copy of FriendRequestAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FriendRequestActionCopyWith<_FriendRequestAction> get copyWith =>
      __$FriendRequestActionCopyWithImpl<_FriendRequestAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FriendRequestActionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendRequestAction &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action);

  @override
  String toString() {
    return 'FriendRequestAction(action: $action)';
  }
}

/// @nodoc
abstract mixin class _$FriendRequestActionCopyWith<$Res>
    implements $FriendRequestActionCopyWith<$Res> {
  factory _$FriendRequestActionCopyWith(_FriendRequestAction value,
          $Res Function(_FriendRequestAction) _then) =
      __$FriendRequestActionCopyWithImpl;
  @override
  @useResult
  $Res call({String action});
}

/// @nodoc
class __$FriendRequestActionCopyWithImpl<$Res>
    implements _$FriendRequestActionCopyWith<$Res> {
  __$FriendRequestActionCopyWithImpl(this._self, this._then);

  final _FriendRequestAction _self;
  final $Res Function(_FriendRequestAction) _then;

  /// Create a copy of FriendRequestAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? action = null,
  }) {
    return _then(_FriendRequestAction(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
