import 'package:json_annotation/json_annotation.dart';

import 'cart.dart';

part 'cart_response_dto.g.dart';

@JsonSerializable()
class CartResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cart")
  final Cart? cart;

  CartResponseDto({this.message, this.numOfCartItems, this.cart});

  factory CartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartResponseDtoToJson(this);
  }
}
