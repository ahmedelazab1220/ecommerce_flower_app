import '../../model/add_product_to_cart_request_dto.dart';
import '../../model/cart_response_dto.dart';
import '../../model/clear_cart_response_dto.dart';
import '../../model/update_product_quantity_request_dto.dart';

abstract class CartRemoteDataSource {
  Future<CartResponseDto> addProductToCart(
    AddProductToCartRequestDto addProductToCartRequestDto,
  );

  Future<CartResponseDto> updateProductInCart(
    String productId,
    UpdateProductQuantityRequestDto updateProductQuantityRequestDto,
  );

  Future<CartResponseDto> getCart();

  Future<CartResponseDto> deleteProductFromCart(String productId);

  Future<ClearCartResponseDto> clearCart();
}
