import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/login/login_request.dart';
import '../entity/register/register_request_entity.dart';
import '../entity/user_enttity.dart';

abstract class AuthRepo {
  Future<Result<void>> login(LoginRequest request);
  Future<void> guestLogin();
  Future<bool> isGuestUser();
  Future<Result<UserEntity>> signUp(RegisterRequestEntity request);
}
