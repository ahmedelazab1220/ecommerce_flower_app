import 'order_items_entity.dart';

class OrderEntity {
  final String? user;
  final List<OrderItemsEntity>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final int? V;

  OrderEntity({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.V,
  });
}
