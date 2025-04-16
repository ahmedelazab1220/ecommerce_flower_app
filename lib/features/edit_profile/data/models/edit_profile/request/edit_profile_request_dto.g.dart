// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestDto _$EditProfileRequestDtoFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestDto(
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['phone'] as String,
    );

Map<String, dynamic> _$EditProfileRequestDtoToJson(
        EditProfileRequestDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phoneNumber,
    };
