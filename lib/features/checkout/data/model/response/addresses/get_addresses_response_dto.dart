import 'package:json_annotation/json_annotation.dart';

import 'address_dto.dart';

part 'get_addresses_response_dto.g.dart';

@JsonSerializable()
class GetAddressesResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "addresses")
  final List<AddressDto>? addresses;

  GetAddressesResponseDto({this.message, this.addresses});

  factory GetAddressesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetAddressesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAddressesResponseDtoToJson(this);
  }
}
