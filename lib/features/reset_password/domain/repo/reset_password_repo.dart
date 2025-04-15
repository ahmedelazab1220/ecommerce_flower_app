import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/reset_password/domain/entities/reset_password_request_entity.dart';

abstract class ResetPasswordRepo {
  Future<Result<void>> resetPassword(ResetPasswordRequestEntity request);
}
