import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../data/model/request/add_order_request_dto.dart';
import '../../data/model/response/cash_order/add_cache_order_response_dto.dart';
import '../repo/checkout_repo.dart';

@injectable
class AddCacheOrderUseCase {
  final CheckoutRepo _checkoutRepo;

  AddCacheOrderUseCase(this._checkoutRepo);

  Future<Result<AddCacheOrderResponseDto>> call(
    AddOrderRequestDto request,
  ) async {
    return await _checkoutRepo.addCacheOrder(request);
  }
}
