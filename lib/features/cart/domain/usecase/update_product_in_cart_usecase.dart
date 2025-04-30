import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:ecommerce_flower_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/update_product_quantity_request_dto.dart';

@injectable
class UpdateProductInCartUsecase {
  final CartRepo _cartRepo;

  UpdateProductInCartUsecase(this._cartRepo);

  Future<Result<CartEntity>> call(
    String productId,
    UpdateProductQuantityRequestDto updateProductQuantityRequestDto,
  ) async {
    return await _cartRepo.updateProductInCart(
      productId,
      updateProductQuantityRequestDto,
    );
  }
}
