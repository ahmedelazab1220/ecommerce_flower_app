// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequestDto _$AddToCartRequestDtoFromJson(Map<String, dynamic> json) =>
    AddToCartRequestDto(
      product: json['product'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddToCartRequestDtoToJson(
        AddToCartRequestDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
