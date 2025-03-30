import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUsecase {
  final AuthRepo _authRepo;

  VerifyResetCodeUsecase(this._authRepo);

  Future<Result<void>> call(
    VerifyResetCodeRequestDto verifyResetCodeRequest,
  ) async {
    return await _authRepo.verifyResetCode(verifyResetCodeRequest);
  }
}
