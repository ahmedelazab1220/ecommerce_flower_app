import '../../model/forget_password/forget_password_request_dto.dart';
import '../../model/forget_password/forget_password_response_dto.dart';
import '../../model/reset_password/reset_password_request_dto.dart';
import '../../model/reset_password/reset_password_response_dto.dart';
import '../../model/verify_reset_code/verify_reset_code_request_dto.dart';
import '../../model/verify_reset_code/verify_reset_code_response_dto.dart';

abstract class AuthRemoteDataSource {
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
