import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/login_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_request_dto/register_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_response_dto/register_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../model/login/login_request_dto.dart';

part 'auth_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClient {
  @factoryMethod
  factory AuthRetrofitClient(Dio dio) = _AuthRetrofitClient;

  @POST(ApiConstants.loginRoute)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);

  @POST(ApiConstants.signupRoute)
  Future<RegisterResponseDto> signUp(@Body() RegisterRequestDto request);
}
