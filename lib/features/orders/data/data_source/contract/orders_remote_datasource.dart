import '../../model/order_response_dto.dart';

abstract class OrdersRemoteDatasource {
  Future<OrderResponseDto> getOrders();
}
