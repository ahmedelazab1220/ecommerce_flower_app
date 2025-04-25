import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/add_order_request_entity.dart';
import '../entity/cash_order_entity/order_entity.dart';
import '../repo/checkout_repo.dart';

@injectable
class AddCacheOrderUseCase {
  final CheckoutRepo _checkoutRepo;

  AddCacheOrderUseCase(this._checkoutRepo);

  Future<Result<OrderEntity?>> call(AddOrderRequestEntity request) async {
    return await _checkoutRepo.addCacheOrder(request);
  }
}
