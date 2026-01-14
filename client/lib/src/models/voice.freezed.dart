// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Voice {
  String get id;
  String get name;
  String get category;
  String? get description;
  @JsonKey(name: 'preview_url')
  String? get previewUrl;
  String get provider;

  /// Create a copy of Voice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VoiceCopyWith<Voice> get copyWith =>
      _$VoiceCopyWithImpl<Voice>(this as Voice, _$identity);

  /// Serializes this Voice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Voice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, category, description, previewUrl, provider);

  @override
  String toString() {
    return 'Voice(id: $id, name: $name, category: $category, description: $description, previewUrl: $previewUrl, provider: $provider)';
  }
}

/// @nodoc
abstract mixin class $VoiceCopyWith<$Res> {
  factory $VoiceCopyWith(Voice value, $Res Function(Voice) _then) =
      _$VoiceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      String? description,
      @JsonKey(name: 'preview_url') String? previewUrl,
      String provider});
}

/// @nodoc
class _$VoiceCopyWithImpl<$Res> implements $VoiceCopyWith<$Res> {
  _$VoiceCopyWithImpl(this._self, this._then);

  final Voice _self;
  final $Res Function(Voice) _then;

  /// Create a copy of Voice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? description = freezed,
    Object? previewUrl = freezed,
    Object? provider = null,
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
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      previewUrl: freezed == previewUrl
          ? _self.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Voice].
extension VoicePatterns on Voice {
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
    TResult Function(_Voice value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Voice() when $default != null:
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
    TResult Function(_Voice value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Voice():
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
    TResult? Function(_Voice value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Voice() when $default != null:
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
            String category,
            String? description,
            @JsonKey(name: 'preview_url') String? previewUrl,
            String provider)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Voice() when $default != null:
        return $default(_that.id, _that.name, _that.category, _that.description,
            _that.previewUrl, _that.provider);
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
            String category,
            String? description,
            @JsonKey(name: 'preview_url') String? previewUrl,
            String provider)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Voice():
        return $default(_that.id, _that.name, _that.category, _that.description,
            _that.previewUrl, _that.provider);
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
            String category,
            String? description,
            @JsonKey(name: 'preview_url') String? previewUrl,
            String provider)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Voice() when $default != null:
        return $default(_that.id, _that.name, _that.category, _that.description,
            _that.previewUrl, _that.provider);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Voice implements Voice {
  const _Voice(
      {required this.id,
      required this.name,
      required this.category,
      this.description,
      @JsonKey(name: 'preview_url') this.previewUrl,
      required this.provider});
  factory _Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  @override
  final String? description;
  @override
  @JsonKey(name: 'preview_url')
  final String? previewUrl;
  @override
  final String provider;

  /// Create a copy of Voice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VoiceCopyWith<_Voice> get copyWith =>
      __$VoiceCopyWithImpl<_Voice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VoiceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Voice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, category, description, previewUrl, provider);

  @override
  String toString() {
    return 'Voice(id: $id, name: $name, category: $category, description: $description, previewUrl: $previewUrl, provider: $provider)';
  }
}

/// @nodoc
abstract mixin class _$VoiceCopyWith<$Res> implements $VoiceCopyWith<$Res> {
  factory _$VoiceCopyWith(_Voice value, $Res Function(_Voice) _then) =
      __$VoiceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      String? description,
      @JsonKey(name: 'preview_url') String? previewUrl,
      String provider});
}

/// @nodoc
class __$VoiceCopyWithImpl<$Res> implements _$VoiceCopyWith<$Res> {
  __$VoiceCopyWithImpl(this._self, this._then);

  final _Voice _self;
  final $Res Function(_Voice) _then;

  /// Create a copy of Voice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? description = freezed,
    Object? previewUrl = freezed,
    Object? provider = null,
  }) {
    return _then(_Voice(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      previewUrl: freezed == previewUrl
          ? _self.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$VoiceList {
  List<Voice> get voices;

  /// Create a copy of VoiceList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VoiceListCopyWith<VoiceList> get copyWith =>
      _$VoiceListCopyWithImpl<VoiceList>(this as VoiceList, _$identity);

  /// Serializes this VoiceList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VoiceList &&
            const DeepCollectionEquality().equals(other.voices, voices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(voices));

  @override
  String toString() {
    return 'VoiceList(voices: $voices)';
  }
}

/// @nodoc
abstract mixin class $VoiceListCopyWith<$Res> {
  factory $VoiceListCopyWith(VoiceList value, $Res Function(VoiceList) _then) =
      _$VoiceListCopyWithImpl;
  @useResult
  $Res call({List<Voice> voices});
}

/// @nodoc
class _$VoiceListCopyWithImpl<$Res> implements $VoiceListCopyWith<$Res> {
  _$VoiceListCopyWithImpl(this._self, this._then);

  final VoiceList _self;
  final $Res Function(VoiceList) _then;

  /// Create a copy of VoiceList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voices = null,
  }) {
    return _then(_self.copyWith(
      voices: null == voices
          ? _self.voices
          : voices // ignore: cast_nullable_to_non_nullable
              as List<Voice>,
    ));
  }
}

/// Adds pattern-matching-related methods to [VoiceList].
extension VoiceListPatterns on VoiceList {
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
    TResult Function(_VoiceList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VoiceList() when $default != null:
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
    TResult Function(_VoiceList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VoiceList():
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
    TResult? Function(_VoiceList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VoiceList() when $default != null:
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
    TResult Function(List<Voice> voices)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VoiceList() when $default != null:
        return $default(_that.voices);
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
    TResult Function(List<Voice> voices) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VoiceList():
        return $default(_that.voices);
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
    TResult? Function(List<Voice> voices)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VoiceList() when $default != null:
        return $default(_that.voices);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VoiceList implements VoiceList {
  const _VoiceList({required final List<Voice> voices}) : _voices = voices;
  factory _VoiceList.fromJson(Map<String, dynamic> json) =>
      _$VoiceListFromJson(json);

  final List<Voice> _voices;
  @override
  List<Voice> get voices {
    if (_voices is EqualUnmodifiableListView) return _voices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voices);
  }

  /// Create a copy of VoiceList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VoiceListCopyWith<_VoiceList> get copyWith =>
      __$VoiceListCopyWithImpl<_VoiceList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VoiceListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VoiceList &&
            const DeepCollectionEquality().equals(other._voices, _voices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_voices));

  @override
  String toString() {
    return 'VoiceList(voices: $voices)';
  }
}

/// @nodoc
abstract mixin class _$VoiceListCopyWith<$Res>
    implements $VoiceListCopyWith<$Res> {
  factory _$VoiceListCopyWith(
          _VoiceList value, $Res Function(_VoiceList) _then) =
      __$VoiceListCopyWithImpl;
  @override
  @useResult
  $Res call({List<Voice> voices});
}

/// @nodoc
class __$VoiceListCopyWithImpl<$Res> implements _$VoiceListCopyWith<$Res> {
  __$VoiceListCopyWithImpl(this._self, this._then);

  final _VoiceList _self;
  final $Res Function(_VoiceList) _then;

  /// Create a copy of VoiceList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? voices = null,
  }) {
    return _then(_VoiceList(
      voices: null == voices
          ? _self._voices
          : voices // ignore: cast_nullable_to_non_nullable
              as List<Voice>,
    ));
  }
}

// dart format on
