import 'package:ecommerce_flower_app/features/orders/data/data_source/contract/orders_remote_datasource.dart';
import 'package:ecommerce_flower_app/features/orders/data/model/order_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../api/orders_retrofit_client.dart';

@Injectable(as: OrdersRemoteDatasource)
class OrdersRemoteDatasourceImpl implements OrdersRemoteDatasource {
  final OrdersRetrofitClient _ordersRetrofitClient;

  OrdersRemoteDatasourceImpl(this._ordersRetrofitClient);

  @override
  Future<OrderResponseDto> getOrders() async {
    return await _ordersRetrofitClient.getOrders();
  }
}
