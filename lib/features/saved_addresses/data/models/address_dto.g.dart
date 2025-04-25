// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      id: json['_id'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'street': instance.street,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'phone': instance.phone,
      'username': instance.username,
    };
