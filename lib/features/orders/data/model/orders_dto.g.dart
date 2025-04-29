// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersDto _$OrdersDtoFromJson(Map<String, dynamic> json) => OrdersDto(
  id: json['_id'] as String?,
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
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  orderNumber: json['orderNumber'] as String?,
  v: (json['__v'] as num?)?.toInt(),
);

Map<String, dynamic> _$OrdersDtoToJson(OrdersDto instance) => <String, dynamic>{
  '_id': instance.id,
  'user': instance.user,
  'orderItems': instance.orderItems,
  'totalPrice': instance.totalPrice,
  'paymentType': instance.paymentType,
  'isPaid': instance.isPaid,
  'isDelivered': instance.isDelivered,
  'state': instance.state,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'orderNumber': instance.orderNumber,
  '__v': instance.v,
};
