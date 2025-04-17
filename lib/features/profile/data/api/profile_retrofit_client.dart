import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../model/user_data_response_dto.dart';

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
