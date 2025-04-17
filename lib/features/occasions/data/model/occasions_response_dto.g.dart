// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasions_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionsResponseDto _$OccasionsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    OccasionsResponseDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => Occasions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OccasionsResponseDtoToJson(
        OccasionsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'occasions': instance.occasions,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };

Occasions _$OccasionsFromJson(Map<String, dynamic> json) => Occasions(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      productsCount: (json['productsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OccasionsToJson(Occasions instance) => <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'productsCount': instance.productsCount,
    };
