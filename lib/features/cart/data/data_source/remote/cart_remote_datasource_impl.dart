import 'package:ecommerce_flower_app/features/cart/data/data_source/contract/cart_remote_datasource.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/add_product_to_cart_request_dto.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/cart_response_dto.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/clear_cart_response_dto.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/update_product_quantity_request_dto.dart';
import 'package:injectable/injectable.dart';

import '../../api/cart_retrofit_client.dart';

@Injectable()
class CartRemoteDatasourceImpl implements CartRemoteDataSource {
  final CartRetrofitClient _cartRetrofitClient;

  CartRemoteDatasourceImpl(this._cartRetrofitClient);

  @override
  Future<CartResponseDto> addProductToCart(
    AddProductToCartRequestDto addProductToCartRequestDto,
  ) {
    return _cartRetrofitClient.addProductToCart(addProductToCartRequestDto);
  }

  @override
  Future<ClearCartResponseDto> clearCart() {
    return _cartRetrofitClient.clearCart();
  }

  @override
  Future<CartResponseDto> deleteProductFromCart(String productId) {
    return _cartRetrofitClient.deleteProductFromCart(productId);
  }

  @override
  Future<CartResponseDto> getCart() {
    return _cartRetrofitClient.getCart();
  }

  @override
  Future<CartResponseDto> updateProductInCart(
    String productId,
    UpdateProductQuantityRequestDto updateProductQuantityRequestDto,
  ) {
    return _cartRetrofitClient.updateProductInCart(
      productId,
      updateProductQuantityRequestDto,
    );
  }
}
