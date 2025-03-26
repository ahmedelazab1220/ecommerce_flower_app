import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/login/login_response_dto.dart';
import '../repo/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRep;

  LoginUseCase(this._authRep);

  Future<Result<void>> call(String email, String password) {
    return _authRep.login(email, password);
  }
}
