// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
  user: json['user'] as String?,
  orderItems:
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
  paymentType: json['paymentType'] as String?,
  isPaid: json['isPaid'] as bool?,
  isDelivered: json['isDelivered'] as bool?,
  state: json['state'] as String?,
  id: json['_id'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  orderNumber: json['orderNumber'] as String?,
  V: (json['__v'] as num?)?.toInt(),
);

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
  'user': instance.user,
  'orderItems': instance.orderItems,
  'totalPrice': instance.totalPrice,
  'paymentType': instance.paymentType,
  'isPaid': instance.isPaid,
  'isDelivered': instance.isDelivered,
  'state': instance.state,
  '_id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'orderNumber': instance.orderNumber,
  '__v': instance.V,
};
