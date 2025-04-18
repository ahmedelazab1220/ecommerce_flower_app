import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/shared_models/product_entity.dart';
import '../../domain/entity/cart_entity.dart';
import 'cart_items.dart';

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
  final int? v;

  Cart({
    this.Id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return _$CartFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartToJson(this);
  }

  CartEntity toEntity() {
    return CartEntity(
      numOfCartItems: cartItems?.length ?? 0,
      cartList:
          cartItems!
              .map(
                (cartItem) => ProductEntity(
                  id: cartItem.product?.id ?? '',
                  title: cartItem.product?.title ?? '',
                  description: cartItem.product?.description ?? '',
                  images: cartItem.product?.images ?? [],
                  imgCover: cartItem.product?.imgCover ?? '',
                  price: cartItem.price ?? 0,
                  quantity: cartItem.quantity ?? 0,
                  category: cartItem.product?.category ?? '',
                  occasion: cartItem.product?.occasion ?? '',
                  createdAt: DateTime.parse(cartItem.product?.createdAt ?? ''),
                  updatedAt: DateTime.parse(cartItem.product?.updatedAt ?? ''),
                  v: cartItem.product?.v ?? 0,
                  discount: cartItem.product?.discount ?? 0,
                  sold: cartItem.product?.sold ?? 0,
                  rateAvg: cartItem.product?.rateAvg ?? 0,
                  rateCount: cartItem.product?.rateCount ?? 0,
                ),
              )
              .toList(),
      totalPrice: totalPrice ?? 0,
      discount: discount ?? 0,
      totalPriceAfterDiscount: totalPriceAfterDiscount ?? 0,
    );
  }
}
