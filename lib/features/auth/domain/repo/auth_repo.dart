import '../../../../core/utils/datasource_excution/api_result.dart';

abstract class AuthRepo {
  Future<Result<void>> login(String email, String password, bool isRememberMe);
}
