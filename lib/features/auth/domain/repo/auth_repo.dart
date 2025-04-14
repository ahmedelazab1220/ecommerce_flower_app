import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/login_request.dart';

abstract class AuthRepo {
  Future<Result<void>> login(LoginRequest request);
  Future<void> guestLogin();
  Future<void> logout();
  Future<bool> isGuestUser();
}
