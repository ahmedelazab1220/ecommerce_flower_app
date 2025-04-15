import 'package:ecommerce_flower_app/features/reset_password/data/models/reset_password_request_dto/reset_password_request_dto.dart';

class ResetPasswordRequestEntity {
  final String password;
  final String newPassword;

  ResetPasswordRequestEntity({
    required this.password,
    required this.newPassword,
  });

  ResetPasswordRequestDto toDto() {
    return ResetPasswordRequestDto(
      password: password,
      newPassword: newPassword,
    );
  }
}
