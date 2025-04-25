// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_addresses_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAddressesResponseDto _$GetAddressesResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetAddressesResponseDto(
  message: json['message'] as String?,
  addresses:
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetAddressesResponseDtoToJson(
  GetAddressesResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'addresses': instance.addresses,
};
