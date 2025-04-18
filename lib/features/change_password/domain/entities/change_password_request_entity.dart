import 'package:ecommerce_flower_app/features/change_password/data/models/change_password_request_dto/change_password_request_dto.dart';

class ChangePasswordRequestEntity {
  final String password;
  final String newPassword;

  ChangePasswordRequestEntity({
    required this.password,
    required this.newPassword,
  });

  ChangePasswordRequestDto toDto() {
    return ChangePasswordRequestDto(
      password: password,
      newPassword: newPassword,
    );
  }
}
