// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateDto _$StateDtoFromJson(Map<String, dynamic> json) => StateDto(
  id: json['id'] as String?,
  governorateNameAr: json['governorate_name_ar'] as String?,
  governorateNameEn: json['governorate_name_en'] as String?,
);

Map<String, dynamic> _$StateDtoToJson(StateDto instance) => <String, dynamic>{
  'id': instance.id,
  'governorate_name_ar': instance.governorateNameAr,
  'governorate_name_en': instance.governorateNameEn,
};
