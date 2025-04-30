import 'package:ecommerce_flower_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/cart_entity.dart';

@injectable
class GetCartUsecase {
  final CartRepo _cartRepo;

  GetCartUsecase(this._cartRepo);

  Future<Result<CartEntity>> call() async {
    return await _cartRepo.getCart();
  }
}
