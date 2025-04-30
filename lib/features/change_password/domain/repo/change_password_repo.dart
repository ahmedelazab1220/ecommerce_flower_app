import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/change_password/domain/entities/change_password_request_entity.dart';

abstract class ChangePasswordRepo {
  Future<Result<void>> changePassword(ChangePasswordRequestEntity request);
}
