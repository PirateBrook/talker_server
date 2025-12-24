// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tag {
  int get id;
  String get name;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TagCopyWith<Tag> get copyWith =>
      _$TagCopyWithImpl<Tag>(this as Tag, _$identity);

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tag &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'Tag(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) _then) = _$TagCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$TagCopyWithImpl<$Res> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._self, this._then);

  final Tag _self;
  final $Res Function(Tag) _then;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Tag].
extension TagPatterns on Tag {
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
    TResult Function(_Tag value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Tag() when $default != null:
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
    TResult Function(_Tag value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tag():
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
    TResult? Function(_Tag value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tag() when $default != null:
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
    TResult Function(int id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Tag() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(int id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tag():
        return $default(_that.id, _that.name);
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
    TResult? Function(int id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tag() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Tag implements Tag {
  const _Tag({required this.id, required this.name});
  factory _Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TagCopyWith<_Tag> get copyWith =>
      __$TagCopyWithImpl<_Tag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TagToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tag &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'Tag(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$TagCopyWith(_Tag value, $Res Function(_Tag) _then) =
      __$TagCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$TagCopyWithImpl<$Res> implements _$TagCopyWith<$Res> {
  __$TagCopyWithImpl(this._self, this._then);

  final _Tag _self;
  final $Res Function(_Tag) _then;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_Tag(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$DialogueSample {
  int get id;
  @JsonKey(name: 'input_text')
  String get inputText;
  @JsonKey(name: 'output_text')
  String get outputText;
  @JsonKey(name: 'character_id')
  String? get characterId;

  /// Create a copy of DialogueSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DialogueSampleCopyWith<DialogueSample> get copyWith =>
      _$DialogueSampleCopyWithImpl<DialogueSample>(
          this as DialogueSample, _$identity);

  /// Serializes this DialogueSample to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DialogueSample &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inputText, inputText) ||
                other.inputText == inputText) &&
            (identical(other.outputText, outputText) ||
                other.outputText == outputText) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, inputText, outputText, characterId);

  @override
  String toString() {
    return 'DialogueSample(id: $id, inputText: $inputText, outputText: $outputText, characterId: $characterId)';
  }
}

/// @nodoc
abstract mixin class $DialogueSampleCopyWith<$Res> {
  factory $DialogueSampleCopyWith(
          DialogueSample value, $Res Function(DialogueSample) _then) =
      _$DialogueSampleCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'input_text') String inputText,
      @JsonKey(name: 'output_text') String outputText,
      @JsonKey(name: 'character_id') String? characterId});
}

/// @nodoc
class _$DialogueSampleCopyWithImpl<$Res>
    implements $DialogueSampleCopyWith<$Res> {
  _$DialogueSampleCopyWithImpl(this._self, this._then);

  final DialogueSample _self;
  final $Res Function(DialogueSample) _then;

  /// Create a copy of DialogueSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? inputText = null,
    Object? outputText = null,
    Object? characterId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inputText: null == inputText
          ? _self.inputText
          : inputText // ignore: cast_nullable_to_non_nullable
              as String,
      outputText: null == outputText
          ? _self.outputText
          : outputText // ignore: cast_nullable_to_non_nullable
              as String,
      characterId: freezed == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DialogueSample].
extension DialogueSamplePatterns on DialogueSample {
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
    TResult Function(_DialogueSample value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DialogueSample() when $default != null:
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
    TResult Function(_DialogueSample value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogueSample():
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
    TResult? Function(_DialogueSample value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogueSample() when $default != null:
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
            @JsonKey(name: 'input_text') String inputText,
            @JsonKey(name: 'output_text') String outputText,
            @JsonKey(name: 'character_id') String? characterId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DialogueSample() when $default != null:
        return $default(
            _that.id, _that.inputText, _that.outputText, _that.characterId);
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
            @JsonKey(name: 'input_text') String inputText,
            @JsonKey(name: 'output_text') String outputText,
            @JsonKey(name: 'character_id') String? characterId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogueSample():
        return $default(
            _that.id, _that.inputText, _that.outputText, _that.characterId);
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
            @JsonKey(name: 'input_text') String inputText,
            @JsonKey(name: 'output_text') String outputText,
            @JsonKey(name: 'character_id') String? characterId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogueSample() when $default != null:
        return $default(
            _that.id, _that.inputText, _that.outputText, _that.characterId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DialogueSample implements DialogueSample {
  const _DialogueSample(
      {required this.id,
      @JsonKey(name: 'input_text') required this.inputText,
      @JsonKey(name: 'output_text') required this.outputText,
      @JsonKey(name: 'character_id') this.characterId});
  factory _DialogueSample.fromJson(Map<String, dynamic> json) =>
      _$DialogueSampleFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'input_text')
  final String inputText;
  @override
  @JsonKey(name: 'output_text')
  final String outputText;
  @override
  @JsonKey(name: 'character_id')
  final String? characterId;

  /// Create a copy of DialogueSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DialogueSampleCopyWith<_DialogueSample> get copyWith =>
      __$DialogueSampleCopyWithImpl<_DialogueSample>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DialogueSampleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DialogueSample &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inputText, inputText) ||
                other.inputText == inputText) &&
            (identical(other.outputText, outputText) ||
                other.outputText == outputText) &&
            (identical(other.characterId, characterId) ||
                other.characterId == characterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, inputText, outputText, characterId);

  @override
  String toString() {
    return 'DialogueSample(id: $id, inputText: $inputText, outputText: $outputText, characterId: $characterId)';
  }
}

/// @nodoc
abstract mixin class _$DialogueSampleCopyWith<$Res>
    implements $DialogueSampleCopyWith<$Res> {
  factory _$DialogueSampleCopyWith(
          _DialogueSample value, $Res Function(_DialogueSample) _then) =
      __$DialogueSampleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'input_text') String inputText,
      @JsonKey(name: 'output_text') String outputText,
      @JsonKey(name: 'character_id') String? characterId});
}

/// @nodoc
class __$DialogueSampleCopyWithImpl<$Res>
    implements _$DialogueSampleCopyWith<$Res> {
  __$DialogueSampleCopyWithImpl(this._self, this._then);

  final _DialogueSample _self;
  final $Res Function(_DialogueSample) _then;

  /// Create a copy of DialogueSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? inputText = null,
    Object? outputText = null,
    Object? characterId = freezed,
  }) {
    return _then(_DialogueSample(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inputText: null == inputText
          ? _self.inputText
          : inputText // ignore: cast_nullable_to_non_nullable
              as String,
      outputText: null == outputText
          ? _self.outputText
          : outputText // ignore: cast_nullable_to_non_nullable
              as String,
      characterId: freezed == characterId
          ? _self.characterId
          : characterId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Character {
  String get id;
  String get name;
  String? get description;
  String? get personality;
  String? get backstory;
  @JsonKey(name: 'voice_style')
  String? get voiceStyle;
  @JsonKey(name: 'interaction_preference')
  String? get interactionPreference;
  @JsonKey(name: 'custom_attributes')
  Map<String, dynamic>? get customAttributes;
  @JsonKey(name: 'is_active')
  bool get isActive;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  List<Tag> get tags;
  @JsonKey(name: 'dialogue_samples')
  List<DialogueSample> get dialogueSamples;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<Character> get copyWith =>
      _$CharacterCopyWithImpl<Character>(this as Character, _$identity);

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Character &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.personality, personality) ||
                other.personality == personality) &&
            (identical(other.backstory, backstory) ||
                other.backstory == backstory) &&
            (identical(other.voiceStyle, voiceStyle) ||
                other.voiceStyle == voiceStyle) &&
            (identical(other.interactionPreference, interactionPreference) ||
                other.interactionPreference == interactionPreference) &&
            const DeepCollectionEquality()
                .equals(other.customAttributes, customAttributes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.dialogueSamples, dialogueSamples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      personality,
      backstory,
      voiceStyle,
      interactionPreference,
      const DeepCollectionEquality().hash(customAttributes),
      isActive,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(dialogueSamples));

  @override
  String toString() {
    return 'Character(id: $id, name: $name, description: $description, personality: $personality, backstory: $backstory, voiceStyle: $voiceStyle, interactionPreference: $interactionPreference, customAttributes: $customAttributes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, dialogueSamples: $dialogueSamples)';
  }
}

/// @nodoc
abstract mixin class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) _then) =
      _$CharacterCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? personality,
      String? backstory,
      @JsonKey(name: 'voice_style') String? voiceStyle,
      @JsonKey(name: 'interaction_preference') String? interactionPreference,
      @JsonKey(name: 'custom_attributes')
      Map<String, dynamic>? customAttributes,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      List<Tag> tags,
      @JsonKey(name: 'dialogue_samples') List<DialogueSample> dialogueSamples});
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res> implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._self, this._then);

  final Character _self;
  final $Res Function(Character) _then;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? personality = freezed,
    Object? backstory = freezed,
    Object? voiceStyle = freezed,
    Object? interactionPreference = freezed,
    Object? customAttributes = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? dialogueSamples = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      personality: freezed == personality
          ? _self.personality
          : personality // ignore: cast_nullable_to_non_nullable
              as String?,
      backstory: freezed == backstory
          ? _self.backstory
          : backstory // ignore: cast_nullable_to_non_nullable
              as String?,
      voiceStyle: freezed == voiceStyle
          ? _self.voiceStyle
          : voiceStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      interactionPreference: freezed == interactionPreference
          ? _self.interactionPreference
          : interactionPreference // ignore: cast_nullable_to_non_nullable
              as String?,
      customAttributes: freezed == customAttributes
          ? _self.customAttributes
          : customAttributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      dialogueSamples: null == dialogueSamples
          ? _self.dialogueSamples
          : dialogueSamples // ignore: cast_nullable_to_non_nullable
              as List<DialogueSample>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Character].
extension CharacterPatterns on Character {
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
    TResult Function(_Character value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Character() when $default != null:
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
    TResult Function(_Character value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Character():
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
    TResult? Function(_Character value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Character() when $default != null:
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
            String name,
            String? description,
            String? personality,
            String? backstory,
            @JsonKey(name: 'voice_style') String? voiceStyle,
            @JsonKey(name: 'interaction_preference')
            String? interactionPreference,
            @JsonKey(name: 'custom_attributes')
            Map<String, dynamic>? customAttributes,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            List<Tag> tags,
            @JsonKey(name: 'dialogue_samples')
            List<DialogueSample> dialogueSamples)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Character() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.personality,
            _that.backstory,
            _that.voiceStyle,
            _that.interactionPreference,
            _that.customAttributes,
            _that.isActive,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.dialogueSamples);
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
            String name,
            String? description,
            String? personality,
            String? backstory,
            @JsonKey(name: 'voice_style') String? voiceStyle,
            @JsonKey(name: 'interaction_preference')
            String? interactionPreference,
            @JsonKey(name: 'custom_attributes')
            Map<String, dynamic>? customAttributes,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            List<Tag> tags,
            @JsonKey(name: 'dialogue_samples')
            List<DialogueSample> dialogueSamples)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Character():
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.personality,
            _that.backstory,
            _that.voiceStyle,
            _that.interactionPreference,
            _that.customAttributes,
            _that.isActive,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.dialogueSamples);
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
            String name,
            String? description,
            String? personality,
            String? backstory,
            @JsonKey(name: 'voice_style') String? voiceStyle,
            @JsonKey(name: 'interaction_preference')
            String? interactionPreference,
            @JsonKey(name: 'custom_attributes')
            Map<String, dynamic>? customAttributes,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            List<Tag> tags,
            @JsonKey(name: 'dialogue_samples')
            List<DialogueSample> dialogueSamples)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Character() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.personality,
            _that.backstory,
            _that.voiceStyle,
            _that.interactionPreference,
            _that.customAttributes,
            _that.isActive,
            _that.createdAt,
            _that.updatedAt,
            _that.tags,
            _that.dialogueSamples);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Character implements Character {
  const _Character(
      {required this.id,
      required this.name,
      this.description,
      this.personality,
      this.backstory,
      @JsonKey(name: 'voice_style') this.voiceStyle,
      @JsonKey(name: 'interaction_preference') this.interactionPreference,
      @JsonKey(name: 'custom_attributes')
      final Map<String, dynamic>? customAttributes,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      final List<Tag> tags = const [],
      @JsonKey(name: 'dialogue_samples')
      final List<DialogueSample> dialogueSamples = const []})
      : _customAttributes = customAttributes,
        _tags = tags,
        _dialogueSamples = dialogueSamples;
  factory _Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? personality;
  @override
  final String? backstory;
  @override
  @JsonKey(name: 'voice_style')
  final String? voiceStyle;
  @override
  @JsonKey(name: 'interaction_preference')
  final String? interactionPreference;
  final Map<String, dynamic>? _customAttributes;
  @override
  @JsonKey(name: 'custom_attributes')
  Map<String, dynamic>? get customAttributes {
    final value = _customAttributes;
    if (value == null) return null;
    if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final List<Tag> _tags;
  @override
  @JsonKey()
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<DialogueSample> _dialogueSamples;
  @override
  @JsonKey(name: 'dialogue_samples')
  List<DialogueSample> get dialogueSamples {
    if (_dialogueSamples is EqualUnmodifiableListView) return _dialogueSamples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dialogueSamples);
  }

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacterCopyWith<_Character> get copyWith =>
      __$CharacterCopyWithImpl<_Character>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CharacterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Character &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.personality, personality) ||
                other.personality == personality) &&
            (identical(other.backstory, backstory) ||
                other.backstory == backstory) &&
            (identical(other.voiceStyle, voiceStyle) ||
                other.voiceStyle == voiceStyle) &&
            (identical(other.interactionPreference, interactionPreference) ||
                other.interactionPreference == interactionPreference) &&
            const DeepCollectionEquality()
                .equals(other._customAttributes, _customAttributes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._dialogueSamples, _dialogueSamples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      personality,
      backstory,
      voiceStyle,
      interactionPreference,
      const DeepCollectionEquality().hash(_customAttributes),
      isActive,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_dialogueSamples));

  @override
  String toString() {
    return 'Character(id: $id, name: $name, description: $description, personality: $personality, backstory: $backstory, voiceStyle: $voiceStyle, interactionPreference: $interactionPreference, customAttributes: $customAttributes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, dialogueSamples: $dialogueSamples)';
  }
}

/// @nodoc
abstract mixin class _$CharacterCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$CharacterCopyWith(
          _Character value, $Res Function(_Character) _then) =
      __$CharacterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? personality,
      String? backstory,
      @JsonKey(name: 'voice_style') String? voiceStyle,
      @JsonKey(name: 'interaction_preference') String? interactionPreference,
      @JsonKey(name: 'custom_attributes')
      Map<String, dynamic>? customAttributes,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      List<Tag> tags,
      @JsonKey(name: 'dialogue_samples') List<DialogueSample> dialogueSamples});
}

/// @nodoc
class __$CharacterCopyWithImpl<$Res> implements _$CharacterCopyWith<$Res> {
  __$CharacterCopyWithImpl(this._self, this._then);

  final _Character _self;
  final $Res Function(_Character) _then;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? personality = freezed,
    Object? backstory = freezed,
    Object? voiceStyle = freezed,
    Object? interactionPreference = freezed,
    Object? customAttributes = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? dialogueSamples = null,
  }) {
    return _then(_Character(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      personality: freezed == personality
          ? _self.personality
          : personality // ignore: cast_nullable_to_non_nullable
              as String?,
      backstory: freezed == backstory
          ? _self.backstory
          : backstory // ignore: cast_nullable_to_non_nullable
              as String?,
      voiceStyle: freezed == voiceStyle
          ? _self.voiceStyle
          : voiceStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      interactionPreference: freezed == interactionPreference
          ? _self.interactionPreference
          : interactionPreference // ignore: cast_nullable_to_non_nullable
              as String?,
      customAttributes: freezed == customAttributes
          ? _self._customAttributes
          : customAttributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      dialogueSamples: null == dialogueSamples
          ? _self._dialogueSamples
          : dialogueSamples // ignore: cast_nullable_to_non_nullable
              as List<DialogueSample>,
    ));
  }
}

// dart format on
