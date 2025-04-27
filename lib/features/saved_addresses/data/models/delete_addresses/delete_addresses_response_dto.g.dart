// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_addresses_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAddressesResponseDto _$DeleteAddressesResponseDtoFromJson(
  Map<String, dynamic> json,
) => DeleteAddressesResponseDto(
  message: json['message'] as String?,
  addresses:
      (json['address'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DeleteAddressesResponseDtoToJson(
  DeleteAddressesResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'address': instance.addresses,
};
