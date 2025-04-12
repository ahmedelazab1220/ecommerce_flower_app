import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/cart_response_dto.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/update_product_quantity_request_dto.dart';

import '../../data/model/add_product_to_cart_request_dto.dart';

abstract class CartRepo {
  Future<Result<CartResponseDto>> addProductToCart(
    AddProductToCartRequestDto addProductToCartRequestDto,
  );

  Future<Result<CartResponseDto>> updateProductInCart(
    UpdateProductQuantityRequestDto updateProductQuantityRequestDto,
  );

  Future<Result<CartResponseDto>> deleteProductFromCart(String productId);

  Future<Result<void>> clearCart();

  Future<Result<void>> getCart();
}
