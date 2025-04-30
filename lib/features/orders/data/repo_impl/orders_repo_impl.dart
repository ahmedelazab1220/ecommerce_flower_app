import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/features/orders/data/data_source/contract/orders_remote_datasource.dart';
import 'package:ecommerce_flower_app/features/orders/domain/entity/order_entity.dart';
import 'package:ecommerce_flower_app/features/orders/domain/repo/orders_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';

@Injectable(as: OrdersRepo)
class OrdersRepoImpl implements OrdersRepo {
  final ApiManager _apiManager;
  final OrdersRemoteDatasource _ordersRemoteDatasource;

  OrdersRepoImpl(this._apiManager, this._ordersRemoteDatasource);

  @override
  Future<Result<List<OrderEntity>>> getOrders() async {
    return await _apiManager.execute(() async {
      final response = await _ordersRemoteDatasource.getOrders();
      return response.orders!.map((e) => e.toEntity()).toList();
    });
  }
}
