import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_request_dto/register_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_response_dto/register_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<Result<RegisterResponseDto>> signUp(RegisterRequestDto request);
}
