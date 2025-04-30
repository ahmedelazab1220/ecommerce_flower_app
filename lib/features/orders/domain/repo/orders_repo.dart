import 'package:ecommerce_flower_app/features/orders/domain/entity/order_entity.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';

abstract class OrdersRepo {
  Future<Result<List<OrderEntity>>> getOrders();
}
