// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataDto _$MetadataDtoFromJson(Map<String, dynamic> json) => MetadataDto(
  city: json['city'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
  phone: json['phone'] as String?,
  street: json['street'] as String?,
);

Map<String, dynamic> _$MetadataDtoToJson(MetadataDto instance) =>
    <String, dynamic>{
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'phone': instance.phone,
      'street': instance.street,
    };
