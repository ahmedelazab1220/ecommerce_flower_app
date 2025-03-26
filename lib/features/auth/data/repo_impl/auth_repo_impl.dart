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
  ) {
    var response = _apiManager.execute(() async {
      final response = await _authRemoteDataSource.forgetPassword(
        forgetPasswordRequestDto,
      );
      return response;
    });
    return response;
  }

  @override
  Future<Result<void>> resetPassword(
    ResetPasswordRequestDto resetPasswordRequestDto,
  ) {
    var response = _apiManager.execute(() async {
      final response = await _authRemoteDataSource.resetPassword(
        resetPasswordRequestDto,
      );
      return response;
    });
    return response;
  }

  @override
  Future<Result<void>> verifyResetCode(
    VerifyResetCodeRequestDto verifyResetCodeRequestDto,
  ) {
    var response = _apiManager.execute(() async {
      final response = await _authRemoteDataSource.verifyResetCode(
        verifyResetCodeRequestDto,
      );
      return response;
    });
    return response;
  }
}
