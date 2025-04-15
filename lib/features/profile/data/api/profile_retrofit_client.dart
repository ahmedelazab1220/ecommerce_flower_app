import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/profile/data/model/user_data_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/utils/datasource_excution/api_constants.dart';

part 'profile_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileRetrofitClient {
  @factoryMethod
  factory ProfileRetrofitClient(Dio dio) = _ProfileRetrofitClient;

  @GET(ApiConstants.profileDataRoute)
  Future<UserDataResponseDto> getUserData();

  @POST(ApiConstants.logoutRoute)
  Future<void> logout();
}
