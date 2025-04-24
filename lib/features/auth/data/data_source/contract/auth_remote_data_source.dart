import '../../model/login/request/login_request_dto.dart';
import '../../model/login/response/login_response_dto.dart';
import '../../model/register/register_request_dto/register_request_dto.dart';
import '../../model/register/register_response_dto/register_response_dto.dart';

import '../../model/forget_password/forget_password_request_dto.dart';
import '../../model/forget_password/forget_password_response_dto.dart';
import '../../model/reset_password/reset_password_request_dto.dart';
import '../../model/reset_password/reset_password_response_dto.dart';
import '../../model/verify_reset_code/verify_reset_code_request_dto.dart';
import '../../model/verify_reset_code/verify_reset_code_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseDto> login(LoginRequestDto request);
  Future<RegisterResponseDto> signUp(RegisterRequestDto request);
  Future<ForgetPasswordResponseDto> forgetPassword(
    ForgetPasswordRequestDto forgetPasswordRequestDto,
  );

  Future<ResetPasswordResponseDto> resetPassword(
    ResetPasswordRequestDto resetPasswordRequestDto,
  );

  Future<VerifyResetCodeResponseDto> verifyResetCode(
    VerifyResetCodeRequestDto verifyResetCodeRequestDto,
  );
}
