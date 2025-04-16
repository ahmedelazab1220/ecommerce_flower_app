import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/register_request_entity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/login_request.dart';

abstract class AuthRepo {
  Future<Result<void>> login(LoginRequest request);
  Future<void> guestLogin();
  Future<void> logout();
  Future<bool> isGuestUser();
  Future<Result<UserEntity>> signUp(RegisterRequestEntity request);
}
