// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionDto _$OccasionDtoFromJson(Map<String, dynamic> json) => OccasionDto(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  productsCount: (json['productsCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$OccasionDtoToJson(OccasionDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'productsCount': instance.productsCount,
    };
