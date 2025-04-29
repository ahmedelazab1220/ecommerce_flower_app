import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/utils/shared_models/address_entity.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto {
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

  AddressDto({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return _$AddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressDtoToJson(this);
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
