import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/update_product_quantity_request_dto.dart';
import 'package:ecommerce_flower_app/features/cart/domain/entity/cart_entity.dart';

import '../../data/model/add_product_to_cart_request_dto.dart';

abstract class CartRepo {
  Future<Result<CartEntity>> addProductToCart(
    AddProductToCartRequestDto addProductToCartRequestDto,
  );

  Future<Result<CartEntity>> updateProductInCart(
    String productId,
    UpdateProductQuantityRequestDto updateProductQuantityRequestDto,
  );

  Future<Result<CartEntity>> deleteProductFromCart(String productId);

  Future<Result<void>> clearCart();

  Future<Result<CartEntity>> getCart();
}
