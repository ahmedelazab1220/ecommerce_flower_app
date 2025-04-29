import '../../../../../core/utils/shared_models/product_entity.dart';

class OrderItemsEntity {
  final ProductEntity? product;
  final int? price;
  final int? quantity;
  final String? id;

  OrderItemsEntity({this.product, this.price, this.quantity, this.id});
}
