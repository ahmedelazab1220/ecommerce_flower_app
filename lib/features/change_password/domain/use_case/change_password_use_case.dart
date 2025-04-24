import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/change_password/domain/entities/change_password_request_entity.dart';
import 'package:ecommerce_flower_app/features/change_password/domain/repo/change_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepo _repo;
  ChangePasswordUseCase(this._repo);
  Future<Result<void>> call(ChangePasswordRequestEntity request) async {
    return await _repo.changePassword(request);
  }
}
