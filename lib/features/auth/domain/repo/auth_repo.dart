import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../data/model/login/login_response_dto.dart';

abstract class AuthRepo {
  Future<Result<void>> login(String email, String password);
}
