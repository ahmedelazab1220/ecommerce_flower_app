import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/order_entity.dart';
import '../repo/orders_repo.dart';

@injectable
class GetOrdersUsecase {
  final OrdersRepo _ordersRepo;

  GetOrdersUsecase(this._ordersRepo);

  Future<Result<List<OrderEntity>>> call() async {
    return await _ordersRepo.getOrders();
  }
}
