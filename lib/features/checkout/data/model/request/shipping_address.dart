import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/utils/shared_models/address_entity.dart';

part 'shipping_address.g.dart';

@JsonSerializable()
class ShippingAddress {
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

  ShippingAddress({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return _$ShippingAddressFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ShippingAddressToJson(this);
  }

  factory ShippingAddress.fromDomain(AddressEntity? entity) {
    return ShippingAddress(
      street: entity?.street,
      phone: entity?.phone,
      city: entity?.city,
      lat: entity?.lat,
      long: entity?.long,
    );
  }
}
