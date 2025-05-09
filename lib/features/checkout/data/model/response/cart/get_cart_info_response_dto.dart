import 'package:json_annotation/json_annotation.dart';

import 'cart_dto.dart';

part 'get_cart_info_response_dto.g.dart';

@JsonSerializable()
class GetCartInfoResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cart")
  final CartDto? cart;

  GetCartInfoResponseDto({this.message, this.numOfCartItems, this.cart});

  factory GetCartInfoResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartInfoResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCartInfoResponseDtoToJson(this);
  }
}
