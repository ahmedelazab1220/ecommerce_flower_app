import 'package:json_annotation/json_annotation.dart';

import 'address_dto.dart';

part 'address_details_response_dto.g.dart';

@JsonSerializable()
class AddressDetailsResponseDto {
  final String? message;
  final List<AddressDto>? addresses;

  const AddressDetailsResponseDto({this.message, this.addresses});

  factory AddressDetailsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddressDetailsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressDetailsResponseDtoToJson(this);
}
