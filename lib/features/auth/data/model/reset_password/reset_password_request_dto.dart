import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "newPassword")
  final String? newPassword;

  ResetPasswordRequestDto ({
    this.email,
    this.newPassword,
  });

  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordRequestDtoToJson(this);
  }
}


