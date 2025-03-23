import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../data/model/login/login_response_dto.dart';

abstract class AuthRepo {
  Future<Result<LoginResponseDto>> login(String email, String password);
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}
