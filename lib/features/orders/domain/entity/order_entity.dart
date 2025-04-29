import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:ecommerce_flower_app/features/orders/domain/entity/order_item_entity.dart';

class OrderEntity {
  final String orderId;
  final String orderNumber;
  final List<OrderItemEntity> orderItems;
  final int totalPrice;
  final bool isPaid;
  final bool isDelivered;
  final String state;

  OrderEntity({
    required this.orderId,
    required this.orderNumber,
    required this.orderItems,
    required this.totalPrice,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
  });
}
