import 'package:json_annotation/json_annotation.dart';

import '../../user_dto.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable()
class EditProfileResponseDto {
  final String? message;
  final UserDto? userDto;

  EditProfileResponseDto({this.message, this.userDto});

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseDtoToJson(this);
}
