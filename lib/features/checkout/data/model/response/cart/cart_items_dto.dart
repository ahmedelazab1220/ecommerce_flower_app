import 'package:json_annotation/json_annotation.dart';

import '../product_dto.dart';

part 'cart_items_dto.g.dart';

@JsonSerializable()
class CartItemsDto {
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? id;

  CartItemsDto({this.product, this.price, this.quantity, this.id});

  factory CartItemsDto.fromJson(Map<String, dynamic> json) {
    return _$CartItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemsDtoToJson(this);
  }
}
