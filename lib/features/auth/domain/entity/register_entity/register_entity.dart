import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';

class RegisterEntity {
  final String message;
  final UserEntity user;
  final String token;

  const RegisterEntity({
    required this.message,
    required this.user,
    required this.token,
  });
}
