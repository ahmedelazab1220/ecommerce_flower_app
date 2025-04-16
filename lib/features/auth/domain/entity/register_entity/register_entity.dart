import 'package:ecommerce_flower_app/features/auth/domain/entity/user_enttity.dart';

class RegisterEntity {
  final String? message;
  final UserEntity? user;

  const RegisterEntity({this.message, this.user});
}
