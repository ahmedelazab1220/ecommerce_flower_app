import 'package:ecommerce_flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:ecommerce_flower_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../data/model/add_product_to_cart_request_dto.dart';

@injectable
class AddProductToCartUsecase {
  final CartRepo _cartRepo;

  AddProductToCartUsecase(this._cartRepo);

  Future<Result<CartEntity>> call(
    AddProductToCartRequestDto addProductToCartRequestDto,
  ) async {
    return await _cartRepo.addProductToCart(addProductToCartRequestDto);
  }
}
