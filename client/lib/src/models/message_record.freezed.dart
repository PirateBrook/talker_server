// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageRecord {
  String get id;
  @JsonKey(name: 'session_id')
  String get sessionId;
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'character_id')
  String get characterId;
  @MessageRoleConverter()
  MessageRole get role;
  String get content;
  @JsonKey(name: 'content_type')
  MessageContentType get contentType;
  @JsonKey(name: 'action_type')
  String? get actionType;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  Map<String, dynamic>? get metadata;

  /// Create a copy of MessageRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageRecordCopyWith<MessageRecord> get copyWith =>
      _$MessageRecordCopyWithImpl<MessageRecord>(
          this as MessageRecord, _$identity);

  /// Serializes this MessageRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      userId,
      characterId,
      role,
      content,
      contentType,
      actionType,
      createdAt,
      const DeepCollectionEquality().hash(metadata));

  @override
  String toString() {
    return 'MessageRecord(id: $id, sessionId: $sessionId, userId: $userId, characterId: $characterId, role: $role, content: $content, contentType: $contentType, actionType: $actionType, createdAt: $createdAt, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class $MessageRecordCopyWith<$Res> {
  factory $MessageRecordCopyWith(
          MessageRecord value, $Res Function(MessageRecord) _then) =
      _$MessageRecordCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'character_id') String characterId,
      @MessageRoleConverter() MessageRole role,
      String content,
      @JsonKey(name: 'content_type') MessageContentType contentType,
      @JsonKey(name: 'action_type') String? actionType,
      @JsonKey(name: 'created_at') DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$MessageRecordCopyWithImpl<$Res>
    implements $MessageRecordCopyWith<$Res> {
  _$MessageRecordCopyWithImpl(this._self, this._then);

  final MessageRecord _self;
  final $Res Function(MessageRecord) _then;

  /// Create a copy of MessageRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? userId = null,
    Object? characterId = null,
    Object? role = null,
    Object? content = null,
    Object? contentType = null,
    Object? actionType = freezed,
    Object? createdAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      characterId: null == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as MessageContentType,
      actionType: freezed == actionType
          ? _self.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MessageRecord].
extension MessageRecordPatterns on MessageRecord {
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
    TResult Function(_MessageRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageRecord() when $default != null:
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
    TResult Function(_MessageRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageRecord():
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
    TResult? Function(_MessageRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageRecord() when $default != null:
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
            String id,
            @JsonKey(name: 'session_id') String sessionId,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'character_id') String characterId,
            @MessageRoleConverter() MessageRole role,
            String content,
            @JsonKey(name: 'content_type') MessageContentType contentType,
            @JsonKey(name: 'action_type') String? actionType,
            @JsonKey(name: 'created_at') DateTime createdAt,
            Map<String, dynamic>? metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageRecord() when $default != null:
        return $default(
            _that.id,
            _that.sessionId,
            _that.userId,
            _that.characterId,
            _that.role,
            _that.content,
            _that.contentType,
            _that.actionType,
            _that.createdAt,
            _that.metadata);
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
            String id,
            @JsonKey(name: 'session_id') String sessionId,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'character_id') String characterId,
            @MessageRoleConverter() MessageRole role,
            String content,
            @JsonKey(name: 'content_type') MessageContentType contentType,
            @JsonKey(name: 'action_type') String? actionType,
            @JsonKey(name: 'created_at') DateTime createdAt,
            Map<String, dynamic>? metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageRecord():
        return $default(
            _that.id,
            _that.sessionId,
            _that.userId,
            _that.characterId,
            _that.role,
            _that.content,
            _that.contentType,
            _that.actionType,
            _that.createdAt,
            _that.metadata);
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
            String id,
            @JsonKey(name: 'session_id') String sessionId,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'character_id') String characterId,
            @MessageRoleConverter() MessageRole role,
            String content,
            @JsonKey(name: 'content_type') MessageContentType contentType,
            @JsonKey(name: 'action_type') String? actionType,
            @JsonKey(name: 'created_at') DateTime createdAt,
            Map<String, dynamic>? metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageRecord() when $default != null:
        return $default(
            _that.id,
            _that.sessionId,
            _that.userId,
            _that.characterId,
            _that.role,
            _that.content,
            _that.contentType,
            _that.actionType,
            _that.createdAt,
            _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MessageRecord implements MessageRecord {
  const _MessageRecord(
      {required this.id,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'character_id') required this.characterId,
      @MessageRoleConverter() required this.role,
      required this.content,
      @JsonKey(name: 'content_type') this.contentType = MessageContentType.text,
      @JsonKey(name: 'action_type') this.actionType,
      @JsonKey(name: 'created_at') required this.createdAt,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;
  factory _MessageRecord.fromJson(Map<String, dynamic> json) =>
      _$MessageRecordFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'session_id')
  final String sessionId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'character_id')
  final String characterId;
  @override
  @MessageRoleConverter()
  final MessageRole role;
  @override
  final String content;
  @override
  @JsonKey(name: 'content_type')
  final MessageContentType contentType;
  @override
  @JsonKey(name: 'action_type')
  final String? actionType;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of MessageRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageRecordCopyWith<_MessageRecord> get copyWith =>
      __$MessageRecordCopyWithImpl<_MessageRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageRecordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      userId,
      characterId,
      role,
      content,
      contentType,
      actionType,
      createdAt,
      const DeepCollectionEquality().hash(_metadata));

  @override
  String toString() {
    return 'MessageRecord(id: $id, sessionId: $sessionId, userId: $userId, characterId: $characterId, role: $role, content: $content, contentType: $contentType, actionType: $actionType, createdAt: $createdAt, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$MessageRecordCopyWith<$Res>
    implements $MessageRecordCopyWith<$Res> {
  factory _$MessageRecordCopyWith(
          _MessageRecord value, $Res Function(_MessageRecord) _then) =
      __$MessageRecordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'character_id') String characterId,
      @MessageRoleConverter() MessageRole role,
      String content,
      @JsonKey(name: 'content_type') MessageContentType contentType,
      @JsonKey(name: 'action_type') String? actionType,
      @JsonKey(name: 'created_at') DateTime createdAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$MessageRecordCopyWithImpl<$Res>
    implements _$MessageRecordCopyWith<$Res> {
  __$MessageRecordCopyWithImpl(this._self, this._then);

  final _MessageRecord _self;
  final $Res Function(_MessageRecord) _then;

  /// Create a copy of MessageRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? userId = null,
    Object? characterId = null,
    Object? role = null,
    Object? content = null,
    Object? contentType = null,
    Object? actionType = freezed,
    Object? createdAt = null,
    Object? metadata = freezed,
  }) {
    return _then(_MessageRecord(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      characterId: null == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as MessageContentType,
      actionType: freezed == actionType
          ? _self.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
