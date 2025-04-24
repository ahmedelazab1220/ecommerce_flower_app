// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseDto _$EditProfileResponseDtoFromJson(
  Map<String, dynamic> json,
) => EditProfileResponseDto(
  message: json['message'] as String?,
  userDto:
      json['userDto'] == null
          ? null
          : UserDto.fromJson(json['userDto'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EditProfileResponseDtoToJson(
  EditProfileResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'userDto': instance.userDto,
};
