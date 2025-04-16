import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/cart_response_dto.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/clear_cart_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../model/add_product_to_cart_request_dto.dart';
import '../model/update_product_quantity_request_dto.dart';

part 'cart_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CartRetrofitClient {
  @factoryMethod
  factory CartRetrofitClient(Dio dio) = _CartRetrofitClient;

  @POST(ApiConstants.cartRoute)
  Future<CartResponseDto> addProductToCart(
    @Body() AddProductToCartRequestDto addProductToCartRequestDto,
  );

  @PUT("${ApiConstants.cartRoute}/{productId}")
  Future<CartResponseDto> updateProductInCart(
    @Path("productId") String productId,
    @Body() UpdateProductQuantityRequestDto updateProductQuantityRequestDto,
  );

  @GET(ApiConstants.cartRoute)
  Future<CartResponseDto> getCart();

  @DELETE("${ApiConstants.cartRoute}/{productId}")
  Future<CartResponseDto> deleteProductFromCart(
    @Path("productId") String productId,
  );

  @DELETE(ApiConstants.cartRoute)
  Future<ClearCartResponseDto> clearCart();
}
