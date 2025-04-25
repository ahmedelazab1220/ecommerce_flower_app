// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemsDto _$OrderItemsDtoFromJson(Map<String, dynamic> json) =>
    OrderItemsDto(
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$OrderItemsDtoToJson(OrderItemsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
