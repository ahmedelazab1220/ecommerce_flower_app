import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../data/model/response/cash_order/add_cache_order_response_dto.dart';
import '../entity/add_order_request_entity.dart';
import '../repo/checkout_repo.dart';

@injectable
class AddCacheOrderUseCase {
  final CheckoutRepo _checkoutRepo;

  AddCacheOrderUseCase(this._checkoutRepo);

  Future<Result<AddCacheOrderResponseDto>> call(
    AddOrderRequestEntity request,
  ) async {
    return await _checkoutRepo.addCacheOrder(request);
  }
}
