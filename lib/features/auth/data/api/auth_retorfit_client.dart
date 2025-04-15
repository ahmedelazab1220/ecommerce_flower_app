import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/response/login_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../model/login/request/login_request_dto.dart';

part 'auth_retorfit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClient {
  @factoryMethod
  factory AuthRetrofitClient(Dio dio) = _AuthRetrofitClient;

  @POST(ApiConstants.loginRoute)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);
}
