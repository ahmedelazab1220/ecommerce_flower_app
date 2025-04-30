import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_constants.dart';
import 'package:ecommerce_flower_app/features/change_password/data/models/change_password_request_dto/change_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/change_password/data/models/change_password_response_dto/change_password_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'change_password_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ChangePasswordRetrofitClient {
  @factoryMethod
  factory ChangePasswordRetrofitClient(Dio dio) = _ChangePasswordRetrofitClient;

  @PATCH(ApiConstants.changePasswordRoute)
  Future<ChangePasswordResponseDto> changePassword(
    @Body() ChangePasswordRequestDto request,
  );
}
