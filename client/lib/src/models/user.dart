import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    String? email,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'is_superuser') @Default(false) bool isSuperuser,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'is_anonymous') @Default(false) bool isAnonymous,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class UserRegister with _$UserRegister {
  const factory UserRegister({
    required String email,
    required String password,
    @JsonKey(name: 'full_name') String? fullName,
  }) = _UserRegister;

  factory UserRegister.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterFromJson(json);

  toJson() => toJson();
}
