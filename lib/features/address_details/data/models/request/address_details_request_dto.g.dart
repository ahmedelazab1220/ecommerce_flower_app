// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetailsRequestDto _$AddressDetailsRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddressDetailsRequestDto(
  street: json['street'] as String,
  phone: json['phone'] as String,
  city: json['city'] as String,
  lat: json['lat'] as String,
  long: json['long'] as String,
  username: json['username'] as String,
);

Map<String, dynamic> _$AddressDetailsRequestDtoToJson(
  AddressDetailsRequestDto instance,
) => <String, dynamic>{
  'street': instance.street,
  'phone': instance.phone,
  'city': instance.city,
  'lat': instance.lat,
  'long': instance.long,
  'username': instance.username,
};
