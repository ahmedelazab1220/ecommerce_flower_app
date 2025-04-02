import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/login_request.dart';
import 'package:injectable/injectable.dart';

import '../repo/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRep;

  LoginUseCase(this._authRep);

  Future<Result<void>> call(LoginRequest request) {
    return _authRep.login(request);
  }
}
