import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import 'package:ecommerce_flower_app/features/cart/data/model/add_product_to_cart_request_dto.dart';

import 'package:ecommerce_flower_app/features/cart/data/model/update_product_quantity_request_dto.dart';
import 'package:ecommerce_flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/cart_repo.dart';
import '../data_source/contract/cart_remote_datasource.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final ApiManager _apiManager;
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepoImpl(this._cartRemoteDataSource, this._apiManager);

  @override
  Future<Result<CartEntity>> addProductToCart(
    AddProductToCartRequestDto addProductToCartRequestDto,
  ) async {
    return await _apiManager.execute(() async {
      final response = await _cartRemoteDataSource.addProductToCart(
        addProductToCartRequestDto,
      );
      return response.cart!.toEntity();
    });
  }

  @override
  Future<Result<void>> clearCart() async {
    return await _apiManager.execute(
      () async => await _cartRemoteDataSource.clearCart(),
    );
  }

  @override
  Future<Result<CartEntity>> deleteProductFromCart(String productId) async {
    return await _apiManager.execute(() async {
      final response = await _cartRemoteDataSource.deleteProductFromCart(
        productId,
      );
      return response.cart!.toEntity();
    });
  }

  @override
  Future<Result<CartEntity>> getCart() async {
    return await _apiManager.execute(() async {
      final response = await _cartRemoteDataSource.getCart();
      return response.cart!.toEntity();
    });
  }

  @override
  Future<Result<CartEntity>> updateProductInCart(
    String productId,
    UpdateProductQuantityRequestDto updateProductQuantityRequestDto,
  ) async {
    return await _apiManager.execute(() async {
      final response = await _cartRemoteDataSource.updateProductInCart(
        productId,
        updateProductQuantityRequestDto,
      );
      return response.cart!.toEntity();
    });
  }
}
