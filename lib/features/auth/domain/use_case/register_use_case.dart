import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/register_entity/register_request_entity.dart';
import '../entity/user_enttity.dart';
import '../repo/auth_repo.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _repository;
  RegisterUseCase(this._repository);

  Future<Result<UserEntity>> call(RegisterRequestEntity request) async {
    return await _repository.signUp(request);
  }
}
