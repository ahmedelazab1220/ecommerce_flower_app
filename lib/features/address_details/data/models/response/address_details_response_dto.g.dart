// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetailsResponseDto _$AddressDetailsResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddressDetailsResponseDto(
  message: json['message'] as String?,
  addresses:
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AddressDetailsResponseDtoToJson(
  AddressDetailsResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'addresses': instance.addresses,
};
