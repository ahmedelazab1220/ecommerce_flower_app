import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/utils/shared_models/address_entity.dart';

part 'shipping_address_dto.g.dart';

@JsonSerializable()
class ShippingAddressDto {
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "lat")
  final String? lat;
  @JsonKey(name: "long")
  final String? long;

  ShippingAddressDto({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });

  factory ShippingAddressDto.fromJson(Map<String, dynamic> json) {
    return _$ShippingAddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ShippingAddressDtoToJson(this);
  }

  factory ShippingAddressDto.fromDomain(AddressEntity? entity) {
    return ShippingAddressDto(
      street: entity?.street,
      phone: entity?.phone,
      city: entity?.city,
      lat: entity?.lat,
      long: entity?.long,
    );
  }
}
