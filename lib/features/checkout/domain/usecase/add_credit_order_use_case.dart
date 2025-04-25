import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/add_order_request_entity.dart';
import '../entity/credit_order_entity/add_credit_order_response_entity.dart';
import '../repo/checkout_repo.dart';

@injectable
class AddCreditOrderUseCase {
  final CheckoutRepo _checkoutRepo;

  AddCreditOrderUseCase(this._checkoutRepo);

  Future<Result<AddCreditOrderResponseEntity>> call(
    AddOrderRequestEntity request,
  ) async {
    return await _checkoutRepo.addCreditOrder(request);
  }
}
