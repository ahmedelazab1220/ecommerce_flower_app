// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequestDto _$ResetPasswordRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequestDto(
      password: json['password'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ResetPasswordRequestDtoToJson(
        ResetPasswordRequestDto instance) =>
    <String, dynamic>{
      'password': instance.password,
      'newPassword': instance.newPassword,
    };
