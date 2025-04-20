import 'package:json_annotation/json_annotation.dart';

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

  ShippingAddress({this.street, this.phone, this.city, this.lat, this.long});

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return _$ShippingAddressFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ShippingAddressToJson(this);
  }
}
