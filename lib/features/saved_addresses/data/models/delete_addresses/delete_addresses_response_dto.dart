import 'package:json_annotation/json_annotation.dart';

import '../address_dto.dart';

part 'delete_addresses_response_dto.g.dart';

@JsonSerializable()
class DeleteAddressesResponseDto {
  final String? message;
  @JsonKey(name: 'address')
  final List<AddressDto>? addresses;

  DeleteAddressesResponseDto({this.message, this.addresses});

  factory DeleteAddressesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddressesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAddressesResponseDtoToJson(this);
}
