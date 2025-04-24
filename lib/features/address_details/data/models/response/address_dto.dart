import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  @JsonKey(name: '_id')
  final String? id;

  const AddressDto({
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

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);
}
