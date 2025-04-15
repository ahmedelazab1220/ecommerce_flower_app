import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  final String password;
  final String newPassword;

  const ResetPasswordRequestDto({
    required this.password,
    required this.newPassword,
  });

  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResetPasswordRequestDtoToJson(this);
}
