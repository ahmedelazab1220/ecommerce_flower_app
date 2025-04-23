import 'package:json_annotation/json_annotation.dart';

import '../address_dto.dart';

part 'saved_addresses_response_dto.g.dart';

@JsonSerializable()
class SavedAddressesResponseDto {
  final String message;
  final List<AddressDto>? addresses;

  SavedAddressesResponseDto({required this.message, this.addresses});

  factory SavedAddressesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SavedAddressesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SavedAddressesResponseDtoToJson(this);
}
