import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUsecase {
  final AuthRepo _authRepo;

  ResetPasswordUsecase(this._authRepo);

  Future<Result<void>> call(ResetPasswordRequestDto resetPasswordRequest) {
    return _authRepo.resetPassword(resetPasswordRequest);
  }
}
