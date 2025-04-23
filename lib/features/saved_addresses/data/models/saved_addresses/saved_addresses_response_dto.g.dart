// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_addresses_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedAddressesResponseDto _$SavedAddressesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    SavedAddressesResponseDto(
      message: json['message'] as String,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SavedAddressesResponseDtoToJson(
        SavedAddressesResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'addresses': instance.addresses,
    };
