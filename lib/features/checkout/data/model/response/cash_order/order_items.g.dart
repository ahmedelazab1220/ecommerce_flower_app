// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
  product:
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  id: json['_id'] as String?,
);

Map<String, dynamic> _$OrderItemsToJson(OrderItems instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
