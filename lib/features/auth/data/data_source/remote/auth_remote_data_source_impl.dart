import 'package:ecommerce_flower_app/features/auth/data/api/auth_retorfit_client.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_response_dto.dart';
import 'package:injectable/injectable.dart';
import '../../api/auth_retrofit_client.dart';
import '../../model/login/request/login_request_dto.dart';
import '../../model/login/response/login_response_dto.dart';
import '../../model/register/register_request_dto/register_request_dto.dart';
import '../../model/register/register_response_dto/register_response_dto.dart';
import '../contract/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthRetrofitClient _authRetrofitClient;

  AuthRemoteDataSourceImpl(this._authRetrofitClient);

  @override
  Future<LoginResponseDto> login(LoginRequestDto request) async {
    return await _authRetrofitClient.login(request);
  }

  @override
  Future<RegisterResponseDto> signUp(RegisterRequestDto request) async {
    final response = await _authRetrofitClient.signUp(request);

    return response;
  }

  @override
  Future<ForgetPasswordResponseDto> forgetPassword(
      ForgetPasswordRequestDto forgetPasswordRequestDto,
      ) async {
    return await _authRetrofitClient.forgetPassword(forgetPasswordRequestDto);
  }

  @override
  Future<ResetPasswordResponseDto> resetPassword(
      ResetPasswordRequestDto resetPasswordRequestDto,
      ) async {
    return await _authRetrofitClient.resetPassword(resetPasswordRequestDto);
  }

  @override
  Future<VerifyResetCodeResponseDto> verifyResetCode(
      VerifyResetCodeRequestDto verifyResetCodeRequestDto,
      ) async {
    return await _authRetrofitClient.verifyResetCode(verifyResetCodeRequestDto);
  }
}
