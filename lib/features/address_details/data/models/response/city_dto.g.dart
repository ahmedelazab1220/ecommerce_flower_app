// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDto _$CityDtoFromJson(Map<String, dynamic> json) => CityDto(
      id: json['id'] as String?,
      governorateId: json['governorate_id'] as String?,
      cityNameAr: json['city_name_ar'] as String?,
      cityNameEn: json['city_name_en'] as String?,
    );

Map<String, dynamic> _$CityDtoToJson(CityDto instance) => <String, dynamic>{
      'id': instance.id,
      'governorate_id': instance.governorateId,
      'city_name_ar': instance.cityNameAr,
      'city_name_en': instance.cityNameEn,
    };
