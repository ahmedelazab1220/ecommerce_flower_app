// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cache_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCacheOrderResponseDto _$AddCacheOrderResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddCacheOrderResponseDto(
  message: json['message'] as String?,
  order:
      json['order'] == null
          ? null
          : OrderDto.fromJson(json['order'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddCacheOrderResponseDtoToJson(
  AddCacheOrderResponseDto instance,
) => <String, dynamic>{'message': instance.message, 'order': instance.order};
