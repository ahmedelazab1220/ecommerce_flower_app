import 'package:ecommerce_flower_app/features/reset_password/data/models/reset_password_request_dto/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/reset_password/data/models/reset_password_response_dto/reset_password_response_dto.dart';

abstract class ResetPasswordDataSource {
  Future<ResetPasswordResponseDto> resetPassword(
    ResetPasswordRequestDto request,
  );
}
