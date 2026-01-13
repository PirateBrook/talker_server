// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
      id: json['id'] as String,
      email: json['email'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      isSuperuser: json['is_superuser'] as bool? ?? false,
      fullName: json['full_name'] as String?,
      isAnonymous: json['is_anonymous'] as bool? ?? false,
      persona: json['persona'] as String?,
    );

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'is_active': instance.isActive,
      'is_superuser': instance.isSuperuser,
      'full_name': instance.fullName,
      'is_anonymous': instance.isAnonymous,
      'persona': instance.persona,
    };

_UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) =>
    _UserRegister(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['full_name'] as String?,
      persona: json['persona'] as String?,
    );

Map<String, dynamic> _$UserRegisterToJson(_UserRegister instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'full_name': instance.fullName,
      'persona': instance.persona,
    };
