import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/utils/shared_features/add_to_cart/data/model/response/cart_items.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "cartItems")
  final List<CartItems>? cartItems;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "totalPriceAfterDiscount")
  final int? totalPriceAfterDiscount;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? V;

  Cart({
    this.Id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.V,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return _$CartFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartToJson(this);
  }
}
