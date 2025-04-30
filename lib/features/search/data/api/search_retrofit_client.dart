import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../model/search_response_dto.dart';

part 'search_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchRetrofitClient {
  @factoryMethod
  factory SearchRetrofitClient(Dio dio) = _SearchRetrofitClient;

  @GET(ApiConstants.allProductsRoute)
  Future<SearchResponseDto> search(@Query('keyword') String keyword);
}
