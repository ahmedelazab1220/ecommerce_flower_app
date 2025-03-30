import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final ApiManager _apiManager = ApiManager();
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<Result<void>> forgetPassword(
    ForgetPasswordRequestDto forgetPasswordRequestDto,
  ) async {
    return await _apiManager.execute(() async {
      await _authRemoteDataSource.forgetPassword(forgetPasswordRequestDto);
    });
  }

  @override
  Future<Result<void>> resetPassword(
    ResetPasswordRequestDto resetPasswordRequestDto,
  ) async {
    return await _apiManager.execute(() async {
      await _authRemoteDataSource.resetPassword(resetPasswordRequestDto);
    });
  }

  @override
  Future<Result<void>> verifyResetCode(
    VerifyResetCodeRequestDto verifyResetCodeRequestDto,
  ) async {
    return await _apiManager.execute(() async {
      await _authRemoteDataSource.verifyResetCode(verifyResetCodeRequestDto);
    });
  }
}
