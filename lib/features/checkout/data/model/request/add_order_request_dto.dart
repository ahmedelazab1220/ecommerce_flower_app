import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/add_order_request_entity.dart';
import 'shipping_address.dart';

part 'add_order_request_dto.g.dart';

@JsonSerializable()
class AddOrderRequestDto {
  @JsonKey(name: "shippingAddress")
  final ShippingAddress? shippingAddress;

  AddOrderRequestDto({required this.shippingAddress});

  factory AddOrderRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddOrderRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddOrderRequestDtoToJson(this);
  }

  factory AddOrderRequestDto.fromDomain(AddOrderRequestEntity entity) {
    return AddOrderRequestDto(
      shippingAddress: ShippingAddress.fromDomain(entity.addressEntity),
    );
  }
}
