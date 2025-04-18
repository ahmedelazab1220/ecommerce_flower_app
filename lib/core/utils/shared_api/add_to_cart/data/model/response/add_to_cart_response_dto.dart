import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../features/cart/data/model/cart.dart';

part 'add_to_cart_response_dto.g.dart';

@JsonSerializable()
class AddToCartResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cart")
  final Cart? cart;

  AddToCartResponseDto({this.message, this.numOfCartItems, this.cart});

  factory AddToCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddToCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddToCartResponseDtoToJson(this);
  }
}
