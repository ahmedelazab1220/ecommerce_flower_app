import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/register_request_entity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';

abstract class AuthRepo {
  Future<Result<UserEntity>> signUp(RegisterRequestEntity request);
}
