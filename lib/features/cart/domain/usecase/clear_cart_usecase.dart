import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearCartUsecase {
  final CartRepo _cartRepo;

  ClearCartUsecase(this._cartRepo);

  Future<Result<void>> call() async {
    return await _cartRepo.clearCart();
  }
}
