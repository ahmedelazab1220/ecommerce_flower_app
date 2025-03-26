import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase {
  final AuthRepo _authRepo;

  ForgetPasswordUsecase(this._authRepo);

  Future<Result<void>> call(ForgetPasswordRequestDto forgetPasswordRequest) {
    return _authRepo.forgetPassword(forgetPasswordRequest);
  }
}
