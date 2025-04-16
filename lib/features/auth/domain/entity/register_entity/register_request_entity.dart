import 'package:ecommerce_flower_app/features/auth/data/model/register/register_request_dto/register_request_dto.dart';

class RegisterRequestEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  final String gender;

  RegisterRequestEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
    required this.gender,
  });

  RegisterRequestDto toDto(RegisterRequestEntity entity) {
    return RegisterRequestDto(
      email: entity.email,
      password: entity.password,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
      gender: entity.gender,
      rePassword: entity.rePassword,
    );
  }
}
