import '../../../../core/utils/shared_models/product_entity.dart';

class OrderItemEntity {
  final ProductEntity product;
  final int quantity;
  final int price;
  final String orderItemId;

  OrderItemEntity({
    required this.product,
    required this.quantity,
    required this.price,
    required this.orderItemId,
  });
}
