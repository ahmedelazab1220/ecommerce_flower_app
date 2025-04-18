// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponseDto _$UserDataResponseDtoFromJson(Map<String, dynamic> json) =>
    UserDataResponseDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataResponseDtoToJson(
        UserDataResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
