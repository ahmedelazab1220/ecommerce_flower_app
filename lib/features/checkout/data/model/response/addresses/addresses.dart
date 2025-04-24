import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/utils/shared_models/address_entity.dart';

part 'addresses.g.dart';

@JsonSerializable()
class Addresses {
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
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "_id")
  final String? id;

  Addresses({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

  factory Addresses.fromJson(Map<String, dynamic> json) {
    return _$AddressesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressesToJson(this);
  }

  AddressEntity toEntity() {
    return AddressEntity(
      street: street,
      city: city,
      lat: lat,
      long: long,
      phone: phone,
    );
  }
}
