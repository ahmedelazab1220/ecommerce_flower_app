import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/address_details_request_entity.dart';

part 'address_details_request_dto.g.dart';

@JsonSerializable()
class AddressDetailsRequestDto {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;

  const AddressDetailsRequestDto({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
  });

  factory AddressDetailsRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddressDetailsRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressDetailsRequestDtoToJson(this);

  factory AddressDetailsRequestDto.fromDomain(
    AddressDetailsRequestEntity entity,
  ) {
    return AddressDetailsRequestDto(
      street: entity.street,
      phone: entity.phone,
      city: entity.city,
      lat: entity.lat,
      long: entity.long,
      username: entity.username,
    );
  }
}
