import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../features/cart/data/model/product.dart';

part 'cart_items.g.dart';

@JsonSerializable()
class CartItems {
  @JsonKey(name: "product")
  final Product? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? Id;

  CartItems({this.product, this.price, this.quantity, this.Id});

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return _$CartItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemsToJson(this);
  }
}
