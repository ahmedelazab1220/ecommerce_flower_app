import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../repo/checkout_repo.dart';
import '../entity/cart_entity.dart';

@injectable
class GetCartInfoUseCase {
  final CheckoutRepo _checkoutRepo;

  GetCartInfoUseCase(this._checkoutRepo);

  Future<Result<CartEntity>> call() async {
    return await _checkoutRepo.getCartInfo();
  }
}
