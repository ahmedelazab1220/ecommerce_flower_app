import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/occasions/data/model/occasions_response_dto.dart';
import 'package:ecommerce_flower_app/features/occasions/data/model/products_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';

part 'occasion_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class OccasionRetrofitClient {
  @factoryMethod
  factory OccasionRetrofitClient(Dio dio) = _OccasionRetrofitClient;

  @GET(ApiConstants.occasionsRoute)
  Future<OccasionsResponseDto> getAllOccasions();

  @GET(ApiConstants.allProductsRoute)
  Future<ProductsResponseDto> getProductsByOccasion(
    @Query("occasion") String occasion,
  );
}
