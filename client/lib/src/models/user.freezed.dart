// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  String get id;
  String? get email;
  @JsonKey(name: 'is_active')
  bool get isActive;
  @JsonKey(name: 'is_superuser')
  bool get isSuperuser;
  @JsonKey(name: 'full_name')
  String? get fullName;
  @JsonKey(name: 'is_anonymous')
  bool get isAnonymous;
  String? get persona;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSuperuser, isSuperuser) ||
                other.isSuperuser == isSuperuser) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.persona, persona) || other.persona == persona));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, isActive, isSuperuser,
      fullName, isAnonymous, persona);

  @override
  String toString() {
    return 'User(id: $id, email: $email, isActive: $isActive, isSuperuser: $isSuperuser, fullName: $fullName, isAnonymous: $isAnonymous, persona: $persona)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? email,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_superuser') bool isSuperuser,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'is_anonymous') bool isAnonymous,
      String? persona});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? isActive = null,
    Object? isSuperuser = null,
    Object? fullName = freezed,
    Object? isAnonymous = null,
    Object? persona = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuperuser: null == isSuperuser
          ? _self.isSuperuser
          : isSuperuser // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      persona: freezed == persona
          ? _self.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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
    TResult Function(_User value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
    TResult Function(_User value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
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
    TResult? Function(_User value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
            String? email,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'is_superuser') bool isSuperuser,
            @JsonKey(name: 'full_name') String? fullName,
            @JsonKey(name: 'is_anonymous') bool isAnonymous,
            String? persona)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.isActive,
            _that.isSuperuser,
            _that.fullName,
            _that.isAnonymous,
            _that.persona);
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
            String? email,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'is_superuser') bool isSuperuser,
            @JsonKey(name: 'full_name') String? fullName,
            @JsonKey(name: 'is_anonymous') bool isAnonymous,
            String? persona)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
        return $default(
            _that.id,
            _that.email,
            _that.isActive,
            _that.isSuperuser,
            _that.fullName,
            _that.isAnonymous,
            _that.persona);
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
            String? email,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'is_superuser') bool isSuperuser,
            @JsonKey(name: 'full_name') String? fullName,
            @JsonKey(name: 'is_anonymous') bool isAnonymous,
            String? persona)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.isActive,
            _that.isSuperuser,
            _that.fullName,
            _that.isAnonymous,
            _that.persona);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  const _User(
      {required this.id,
      this.email,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'is_superuser') this.isSuperuser = false,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'is_anonymous') this.isAnonymous = false,
      this.persona});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_superuser')
  final bool isSuperuser;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'is_anonymous')
  final bool isAnonymous;
  @override
  final String? persona;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSuperuser, isSuperuser) ||
                other.isSuperuser == isSuperuser) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.persona, persona) || other.persona == persona));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, isActive, isSuperuser,
      fullName, isAnonymous, persona);

  @override
  String toString() {
    return 'User(id: $id, email: $email, isActive: $isActive, isSuperuser: $isSuperuser, fullName: $fullName, isAnonymous: $isAnonymous, persona: $persona)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? email,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_superuser') bool isSuperuser,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'is_anonymous') bool isAnonymous,
      String? persona});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? isActive = null,
    Object? isSuperuser = null,
    Object? fullName = freezed,
    Object? isAnonymous = null,
    Object? persona = freezed,
  }) {
    return _then(_User(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuperuser: null == isSuperuser
          ? _self.isSuperuser
          : isSuperuser // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      persona: freezed == persona
          ? _self.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UserRegister {
  String get email;
  String get password;
  @JsonKey(name: 'full_name')
  String? get fullName;
  String? get persona;

  /// Create a copy of UserRegister
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRegisterCopyWith<UserRegister> get copyWith =>
      _$UserRegisterCopyWithImpl<UserRegister>(
          this as UserRegister, _$identity);

  /// Serializes this UserRegister to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRegister &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.persona, persona) || other.persona == persona));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, fullName, persona);

  @override
  String toString() {
    return 'UserRegister(email: $email, password: $password, fullName: $fullName, persona: $persona)';
  }
}

/// @nodoc
abstract mixin class $UserRegisterCopyWith<$Res> {
  factory $UserRegisterCopyWith(
          UserRegister value, $Res Function(UserRegister) _then) =
      _$UserRegisterCopyWithImpl;
  @useResult
  $Res call(
      {String email,
      String password,
      @JsonKey(name: 'full_name') String? fullName,
      String? persona});
}

/// @nodoc
class _$UserRegisterCopyWithImpl<$Res> implements $UserRegisterCopyWith<$Res> {
  _$UserRegisterCopyWithImpl(this._self, this._then);

  final UserRegister _self;
  final $Res Function(UserRegister) _then;

  /// Create a copy of UserRegister
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = freezed,
    Object? persona = freezed,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      persona: freezed == persona
          ? _self.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserRegister].
extension UserRegisterPatterns on UserRegister {
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
    TResult Function(_UserRegister value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserRegister() when $default != null:
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
    TResult Function(_UserRegister value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserRegister():
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
    TResult? Function(_UserRegister value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserRegister() when $default != null:
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
    TResult Function(String email, String password,
            @JsonKey(name: 'full_name') String? fullName, String? persona)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserRegister() when $default != null:
        return $default(
            _that.email, _that.password, _that.fullName, _that.persona);
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
    TResult Function(String email, String password,
            @JsonKey(name: 'full_name') String? fullName, String? persona)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserRegister():
        return $default(
            _that.email, _that.password, _that.fullName, _that.persona);
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
    TResult? Function(String email, String password,
            @JsonKey(name: 'full_name') String? fullName, String? persona)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserRegister() when $default != null:
        return $default(
            _that.email, _that.password, _that.fullName, _that.persona);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserRegister implements UserRegister {
  const _UserRegister(
      {required this.email,
      required this.password,
      @JsonKey(name: 'full_name') this.fullName,
      this.persona});
  factory _UserRegister.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  final String? persona;

  /// Create a copy of UserRegister
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRegisterCopyWith<_UserRegister> get copyWith =>
      __$UserRegisterCopyWithImpl<_UserRegister>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRegisterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRegister &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.persona, persona) || other.persona == persona));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, fullName, persona);

  @override
  String toString() {
    return 'UserRegister(email: $email, password: $password, fullName: $fullName, persona: $persona)';
  }
}

/// @nodoc
abstract mixin class _$UserRegisterCopyWith<$Res>
    implements $UserRegisterCopyWith<$Res> {
  factory _$UserRegisterCopyWith(
          _UserRegister value, $Res Function(_UserRegister) _then) =
      __$UserRegisterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      @JsonKey(name: 'full_name') String? fullName,
      String? persona});
}

/// @nodoc
class __$UserRegisterCopyWithImpl<$Res>
    implements _$UserRegisterCopyWith<$Res> {
  __$UserRegisterCopyWithImpl(this._self, this._then);

  final _UserRegister _self;
  final $Res Function(_UserRegister) _then;

  /// Create a copy of UserRegister
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = freezed,
    Object? persona = freezed,
  }) {
    return _then(_UserRegister(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      persona: freezed == persona
          ? _self.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
