import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_constants.dart';
import 'package:ecommerce_flower_app/features/reset_password/data/models/reset_password_request_dto/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/reset_password/data/models/reset_password_response_dto/reset_password_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'reset_password_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ResetPasswordRetrofitClient {
  @factoryMethod
  factory ResetPasswordRetrofitClient(Dio dio) = _ResetPasswordRetrofitClient;

  @PATCH(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponseDto> resetPassword(
    @Body() ResetPasswordRequestDto request,
  );
}
