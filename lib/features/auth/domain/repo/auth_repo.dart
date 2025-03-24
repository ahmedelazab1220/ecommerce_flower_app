import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_request_dto.dart';

import '../../data/model/forget_password/forget_password_request_dto.dart';
import '../../data/model/verify_reset_code/verify_reset_code_request_dto.dart';

abstract interface class AuthRepo {
  Future<Result<void>> forgetPassword(ForgetPasswordRequestDto forgetPasswordRequestDto);
  Future<Result<void>> verifyResetCode(VerifyResetCodeRequestDto verifyResetCodeRequestDto);
  Future<Result<void>> resetPassword(ResetPasswordRequestDto resetPasswordRequestDto);
}