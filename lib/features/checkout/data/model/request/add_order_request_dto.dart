import 'package:ecommerce_flower_app/features/checkout/data/model/request/shipping_address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_order_request_dto.g.dart';

@JsonSerializable()
class AddOrderRequestDto {
  @JsonKey(name: "shippingAddress")
  final ShippingAddress? shippingAddress;

  AddOrderRequestDto({this.shippingAddress});

  factory AddOrderRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddOrderRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddOrderRequestDtoToJson(this);
  }
}
