import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/orders/data/model/order_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';

part 'orders_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class OrdersRetrofitClient {
  @factoryMethod
  factory OrdersRetrofitClient(Dio dio) = _OrdersRetrofitClient;

  @GET(ApiConstants.addCacheOrderRoute)
  Future<OrderResponseDto> getOrders();
}
