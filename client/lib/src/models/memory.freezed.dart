// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterMemory {
  int get id;
  @JsonKey(name: 'character_id')
  String get characterId;
  @JsonKey(name: 'user_id')
  String? get userId;
  @JsonKey(name: 'source_message_id')
  String? get sourceMessageId;
  String get content;
  @JsonKey(name: 'is_manual')
  bool get isManual;

  /// Create a copy of CharacterMemory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharacterMemoryCopyWith<CharacterMemory> get copyWith =>
      _$CharacterMemoryCopyWithImpl<CharacterMemory>(
          this as CharacterMemory, _$identity);

  /// Serializes this CharacterMemory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharacterMemory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sourceMessageId, sourceMessageId) ||
                other.sourceMessageId == sourceMessageId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isManual, isManual) ||
                other.isManual == isManual));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, characterId, userId, sourceMessageId, content, isManual);

  @override
  String toString() {
    return 'CharacterMemory(id: $id, characterId: $characterId, userId: $userId, sourceMessageId: $sourceMessageId, content: $content, isManual: $isManual)';
  }
}

/// @nodoc
abstract mixin class $CharacterMemoryCopyWith<$Res> {
  factory $CharacterMemoryCopyWith(
          CharacterMemory value, $Res Function(CharacterMemory) _then) =
      _$CharacterMemoryCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'character_id') String characterId,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'source_message_id') String? sourceMessageId,
      String content,
      @JsonKey(name: 'is_manual') bool isManual});
}

/// @nodoc
class _$CharacterMemoryCopyWithImpl<$Res>
    implements $CharacterMemoryCopyWith<$Res> {
  _$CharacterMemoryCopyWithImpl(this._self, this._then);

  final CharacterMemory _self;
  final $Res Function(CharacterMemory) _then;

  /// Create a copy of CharacterMemory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? characterId = null,
    Object? userId = freezed,
    Object? sourceMessageId = freezed,
    Object? content = null,
    Object? isManual = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      characterId: null == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceMessageId: freezed == sourceMessageId
          ? _self.sourceMessageId
          : sourceMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isManual: null == isManual
          ? _self.isManual
          : isManual // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CharacterMemory].
extension CharacterMemoryPatterns on CharacterMemory {
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
    TResult Function(_CharacterMemory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CharacterMemory() when $default != null:
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
    TResult Function(_CharacterMemory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CharacterMemory():
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
    TResult? Function(_CharacterMemory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CharacterMemory() when $default != null:
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
            int id,
            @JsonKey(name: 'character_id') String characterId,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'source_message_id') String? sourceMessageId,
            String content,
            @JsonKey(name: 'is_manual') bool isManual)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CharacterMemory() when $default != null:
        return $default(_that.id, _that.characterId, _that.userId,
            _that.sourceMessageId, _that.content, _that.isManual);
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
            int id,
            @JsonKey(name: 'character_id') String characterId,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'source_message_id') String? sourceMessageId,
            String content,
            @JsonKey(name: 'is_manual') bool isManual)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CharacterMemory():
        return $default(_that.id, _that.characterId, _that.userId,
            _that.sourceMessageId, _that.content, _that.isManual);
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
            int id,
            @JsonKey(name: 'character_id') String characterId,
            @JsonKey(name: 'user_id') String? userId,
            @JsonKey(name: 'source_message_id') String? sourceMessageId,
            String content,
            @JsonKey(name: 'is_manual') bool isManual)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CharacterMemory() when $default != null:
        return $default(_that.id, _that.characterId, _that.userId,
            _that.sourceMessageId, _that.content, _that.isManual);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CharacterMemory implements CharacterMemory {
  const _CharacterMemory(
      {required this.id,
      @JsonKey(name: 'character_id') required this.characterId,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'source_message_id') this.sourceMessageId,
      required this.content,
      @JsonKey(name: 'is_manual') this.isManual = false});
  factory _CharacterMemory.fromJson(Map<String, dynamic> json) =>
      _$CharacterMemoryFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'character_id')
  final String characterId;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'source_message_id')
  final String? sourceMessageId;
  @override
  final String content;
  @override
  @JsonKey(name: 'is_manual')
  final bool isManual;

  /// Create a copy of CharacterMemory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacterMemoryCopyWith<_CharacterMemory> get copyWith =>
      __$CharacterMemoryCopyWithImpl<_CharacterMemory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterMemoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterMemory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sourceMessageId, sourceMessageId) ||
                other.sourceMessageId == sourceMessageId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isManual, isManual) ||
                other.isManual == isManual));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, characterId, userId, sourceMessageId, content, isManual);

  @override
  String toString() {
    return 'CharacterMemory(id: $id, characterId: $characterId, userId: $userId, sourceMessageId: $sourceMessageId, content: $content, isManual: $isManual)';
  }
}

/// @nodoc
abstract mixin class _$CharacterMemoryCopyWith<$Res>
    implements $CharacterMemoryCopyWith<$Res> {
  factory _$CharacterMemoryCopyWith(
          _CharacterMemory value, $Res Function(_CharacterMemory) _then) =
      __$CharacterMemoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'character_id') String characterId,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'source_message_id') String? sourceMessageId,
      String content,
      @JsonKey(name: 'is_manual') bool isManual});
}

/// @nodoc
class __$CharacterMemoryCopyWithImpl<$Res>
    implements _$CharacterMemoryCopyWith<$Res> {
  __$CharacterMemoryCopyWithImpl(this._self, this._then);

  final _CharacterMemory _self;
  final $Res Function(_CharacterMemory) _then;

  /// Create a copy of CharacterMemory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? characterId = null,
    Object? userId = freezed,
    Object? sourceMessageId = freezed,
    Object? content = null,
    Object? isManual = null,
  }) {
    return _then(_CharacterMemory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      characterId: null == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceMessageId: freezed == sourceMessageId
          ? _self.sourceMessageId
          : sourceMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isManual: null == isManual
          ? _self.isManual
          : isManual // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$MemoryCreate {
  String get content;
  @JsonKey(name: 'is_manual')
  bool get isManual;

  /// Create a copy of MemoryCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemoryCreateCopyWith<MemoryCreate> get copyWith =>
      _$MemoryCreateCopyWithImpl<MemoryCreate>(
          this as MemoryCreate, _$identity);

  /// Serializes this MemoryCreate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemoryCreate &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isManual, isManual) ||
                other.isManual == isManual));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, isManual);

  @override
  String toString() {
    return 'MemoryCreate(content: $content, isManual: $isManual)';
  }
}

/// @nodoc
abstract mixin class $MemoryCreateCopyWith<$Res> {
  factory $MemoryCreateCopyWith(
          MemoryCreate value, $Res Function(MemoryCreate) _then) =
      _$MemoryCreateCopyWithImpl;
  @useResult
  $Res call({String content, @JsonKey(name: 'is_manual') bool isManual});
}

/// @nodoc
class _$MemoryCreateCopyWithImpl<$Res> implements $MemoryCreateCopyWith<$Res> {
  _$MemoryCreateCopyWithImpl(this._self, this._then);

  final MemoryCreate _self;
  final $Res Function(MemoryCreate) _then;

  /// Create a copy of MemoryCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? isManual = null,
  }) {
    return _then(_self.copyWith(
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isManual: null == isManual
          ? _self.isManual
          : isManual // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [MemoryCreate].
extension MemoryCreatePatterns on MemoryCreate {
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
    TResult Function(_MemoryCreate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemoryCreate() when $default != null:
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
    TResult Function(_MemoryCreate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemoryCreate():
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
    TResult? Function(_MemoryCreate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemoryCreate() when $default != null:
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
    TResult Function(String content, @JsonKey(name: 'is_manual') bool isManual)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemoryCreate() when $default != null:
        return $default(_that.content, _that.isManual);
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
    TResult Function(String content, @JsonKey(name: 'is_manual') bool isManual)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemoryCreate():
        return $default(_that.content, _that.isManual);
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
            String content, @JsonKey(name: 'is_manual') bool isManual)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemoryCreate() when $default != null:
        return $default(_that.content, _that.isManual);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MemoryCreate implements MemoryCreate {
  const _MemoryCreate(
      {required this.content,
      @JsonKey(name: 'is_manual') this.isManual = false});
  factory _MemoryCreate.fromJson(Map<String, dynamic> json) =>
      _$MemoryCreateFromJson(json);

  @override
  final String content;
  @override
  @JsonKey(name: 'is_manual')
  final bool isManual;

  /// Create a copy of MemoryCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemoryCreateCopyWith<_MemoryCreate> get copyWith =>
      __$MemoryCreateCopyWithImpl<_MemoryCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MemoryCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemoryCreate &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isManual, isManual) ||
                other.isManual == isManual));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, isManual);

  @override
  String toString() {
    return 'MemoryCreate(content: $content, isManual: $isManual)';
  }
}

/// @nodoc
abstract mixin class _$MemoryCreateCopyWith<$Res>
    implements $MemoryCreateCopyWith<$Res> {
  factory _$MemoryCreateCopyWith(
          _MemoryCreate value, $Res Function(_MemoryCreate) _then) =
      __$MemoryCreateCopyWithImpl;
  @override
  @useResult
  $Res call({String content, @JsonKey(name: 'is_manual') bool isManual});
}

/// @nodoc
class __$MemoryCreateCopyWithImpl<$Res>
    implements _$MemoryCreateCopyWith<$Res> {
  __$MemoryCreateCopyWithImpl(this._self, this._then);

  final _MemoryCreate _self;
  final $Res Function(_MemoryCreate) _then;

  /// Create a copy of MemoryCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = null,
    Object? isManual = null,
  }) {
    return _then(_MemoryCreate(
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isManual: null == isManual
          ? _self.isManual
          : isManual // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
