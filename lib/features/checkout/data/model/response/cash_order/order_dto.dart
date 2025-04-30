import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/cash_order_entity/order_entity.dart';
import 'order_items_dto.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "orderItems")
  final List<OrderItemsDto>? orderItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "paymentType")
  final String? paymentType;
  @JsonKey(name: "isPaid")
  final bool? isPaid;
  @JsonKey(name: "isDelivered")
  final bool? isDelivered;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "__v")
  final int? V;

  OrderDto({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.V,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) {
    return _$OrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderDtoToJson(this);
  }

  OrderEntity toEntity() => OrderEntity(
    user: user,
    orderItems: orderItems?.map((e) => e.toEntity()).toList(),
    totalPrice: totalPrice,
    paymentType: paymentType,
    isPaid: isPaid,
    isDelivered: isDelivered,
    state: state,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    orderNumber: orderNumber,
    V: V,
  );
}
