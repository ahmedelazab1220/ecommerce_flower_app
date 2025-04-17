import 'package:json_annotation/json_annotation.dart';

import 'user_dto.dart';

part 'user_data_response_dto.g.dart';

@JsonSerializable()
class UserDataResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;

  UserDataResponseDto({this.message, this.user});

  factory UserDataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UserDataResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDataResponseDtoToJson(this);
  }
}
