import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/response/login_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_request_dto/register_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_response_dto/register_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../model/forget_password/forget_password_request_dto.dart';
import '../model/forget_password/forget_password_response_dto.dart';
import '../model/login/request/login_request_dto.dart';
import '../model/reset_password/reset_password_request_dto.dart';
import '../model/reset_password/reset_password_response_dto.dart';
import '../model/verify_reset_code/verify_reset_code_request_dto.dart';
import '../model/verify_reset_code/verify_reset_code_response_dto.dart';

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

  @POST(ApiConstants.forgetPasswordRoute)
  Future<ForgetPasswordResponseDto> forgetPassword(
    @Body() ForgetPasswordRequestDto forgetPasswordRequestDto,
  );

  @POST(ApiConstants.verifyRestCodeRoute)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
    @Body() VerifyResetCodeRequestDto verifyResetCodeRequestDto,
  );

  @PUT(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponseDto> resetPassword(
    @Body() ResetPasswordRequestDto resetPasswordRequestDto,
  );
}
