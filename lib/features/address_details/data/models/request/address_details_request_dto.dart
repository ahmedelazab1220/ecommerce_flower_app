import 'package:json_annotation/json_annotation.dart';

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
}
