import 'package:ecommerce_flower_app/features/checkout/domain/entity/addresses_entity.dart';
import 'package:json_annotation/json_annotation.dart';

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

  AddressesEntity toEntity() {
    return AddressesEntity(
      street: street,
      city: city,
      lat: lat,
      long: long,
      phone: phone,
    );
  }
}
