import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/register_request_entity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepo repository;
  RegisterUseCase(this.repository);

  Future<Result<UserEntity>> call(RegisterRequestEntity request) async {
    return await repository.signUp(request);
  }
}
