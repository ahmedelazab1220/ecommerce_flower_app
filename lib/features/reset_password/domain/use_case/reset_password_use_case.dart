import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/reset_password/domain/entities/reset_password_request_entity.dart';
import 'package:ecommerce_flower_app/features/reset_password/domain/repo/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepo _repo;
  ResetPasswordUseCase(this._repo);
  Future<Result<void>> call(ResetPasswordRequestEntity request) async {
    return await _repo.resetPassword(request);
  }
}
