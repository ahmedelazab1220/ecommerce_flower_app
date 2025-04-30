import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/add_order_request_entity.dart';
import 'shipping_address_dto.dart';

part 'add_order_request_dto.g.dart';

@JsonSerializable()
class AddOrderRequestDto {
  @JsonKey(name: "shippingAddress")
  final ShippingAddressDto? shippingAddress;

  AddOrderRequestDto({required this.shippingAddress});

  factory AddOrderRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddOrderRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddOrderRequestDtoToJson(this);
  }

  factory AddOrderRequestDto.fromDomain(AddOrderRequestEntity entity) {
    return AddOrderRequestDto(
      shippingAddress: ShippingAddressDto.fromDomain(entity.addressEntity),
    );
  }
}
