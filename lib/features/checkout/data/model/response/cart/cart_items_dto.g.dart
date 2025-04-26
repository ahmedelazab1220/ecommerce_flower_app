// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemsDto _$CartItemsDtoFromJson(Map<String, dynamic> json) => CartItemsDto(
  product:
      json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  id: json['_id'] as String?,
);

Map<String, dynamic> _$CartItemsDtoToJson(CartItemsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
