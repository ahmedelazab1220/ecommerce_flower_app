import 'package:json_annotation/json_annotation.dart';

part 'add_product_to_cart_request_dto.g.dart';

@JsonSerializable()
class AddProductToCartRequestDto {
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "quantity")
  final int? quantity;

  AddProductToCartRequestDto ({
    this.product,
    this.quantity,
  });

  factory AddProductToCartRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddProductToCartRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductToCartRequestDtoToJson(this);
  }
}


