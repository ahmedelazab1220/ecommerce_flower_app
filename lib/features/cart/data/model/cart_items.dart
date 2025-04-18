import 'package:ecommerce_flower_app/features/cart/data/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

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
  final String? id;

  CartItems({this.product, this.price, this.quantity, this.id});

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return _$CartItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemsToJson(this);
  }
}
