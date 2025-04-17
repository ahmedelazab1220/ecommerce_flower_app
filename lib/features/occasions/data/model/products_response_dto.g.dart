// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponseDto _$ProductsResponseDtoFromJson(Map<String, dynamic> json) =>
    ProductsResponseDto(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProductsResponseDtoToJson(
  ProductsResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'products': instance.products,
};
