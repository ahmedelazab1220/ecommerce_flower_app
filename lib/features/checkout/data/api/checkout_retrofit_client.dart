import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/response/credit_order/add_credit_order_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../model/request/add_order_request_dto.dart';
import '../model/response/addresses/get_addresses_response_dto.dart';
import '../model/response/cart/get_cart_info_response_dto.dart';
import '../model/response/cash_order/add_cache_order_response_dto.dart';

part 'checkout_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CheckoutRetrofitClient {
  @factoryMethod
  factory CheckoutRetrofitClient(Dio dio) = _CheckoutRetrofitClient;

  @GET(ApiConstants.addressesRoute)
  Future<GetAddressesResponseDto> getAddresses();

  @POST(ApiConstants.addCacheOrderRoute)
  Future<AddCacheOrderResponseDto> addCacheOrder(
    @Body() AddOrderRequestDto request,
  );

  @POST(ApiConstants.addCreditOrderRoute)
  Future<AddCreditOrderResponseDto> addCreditOrder(
    @Body() AddOrderRequestDto request,
  );

  @GET(ApiConstants.cartRoute)
  Future<GetCartInfoResponseDto> getCartInfo();
}
