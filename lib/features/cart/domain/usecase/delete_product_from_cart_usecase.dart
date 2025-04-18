import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:ecommerce_flower_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteProductFromCartUsecase {
  final CartRepo _cartRepo;

  DeleteProductFromCartUsecase(this._cartRepo);

  Future<Result<CartEntity>> call(String productId) async {
    return await _cartRepo.deleteProductFromCart(productId);
  }
}
