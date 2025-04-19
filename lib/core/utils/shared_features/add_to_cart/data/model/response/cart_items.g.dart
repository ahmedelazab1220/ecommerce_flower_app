// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
