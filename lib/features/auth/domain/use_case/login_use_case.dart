import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/login/login_request.dart';
import '../repo/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRep;

  LoginUseCase(this._authRep);

  Future<Result<void>> call(LoginRequest request) async {
    return await _authRep.login(request);
  }
}
