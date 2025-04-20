import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/utils/shared_features/add_to_cart/data/model/response/product.dart';

part 'order_items.g.dart';

@JsonSerializable()
class OrderItems {
  @JsonKey(name: "product")
  final Product? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? Id;

  OrderItems({this.product, this.price, this.quantity, this.Id});

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsToJson(this);
  }
}
