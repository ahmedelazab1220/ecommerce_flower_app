import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../features/cart/data/model/add_product_to_cart_request_dto.dart';
import '../../../../datasource_excution/api_constants.dart';
import '../model/response/add_to_cart_response_dto.dart';

part 'add_to_cart_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AddToCartRetrofitClient {
  @factoryMethod
  factory AddToCartRetrofitClient(Dio dio) = _AddToCartRetrofitClient;

  @POST(ApiConstants.cartRoute)
  Future<AddToCartResponseDto> addProductToCart(
    @Body() AddProductToCartRequestDto addProductToCartRequestDto,
  );
}
