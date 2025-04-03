import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../models/response/home_response_dto.dart';

part 'home_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeRetrofitClient {
  @factoryMethod
  factory HomeRetrofitClient(Dio dio) = _HomeRetrofitClient;

  @GET(ApiConstants.homeTabRoute)
  Future<HomeResponseDto> getHomeData();
}
