import 'package:json_annotation/json_annotation.dart';
import 'package:ecommerce_flower_app/features/orders/data/model/order_items_dto.dart';
import 'package:ecommerce_flower_app/features/orders/domain/entity/order_entity.dart';

import '../../../../core/utils/shared_models/product_entity.dart';
import '../../domain/entity/order_item_entity.dart';

part 'orders_dto.g.dart';

@JsonSerializable()
class OrdersDto {
  @JsonKey(name: "_id")
  final String? id;
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
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "__v")
  final int? v;

  OrdersDto({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  factory OrdersDto.fromJson(Map<String, dynamic> json) {
    return _$OrdersDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersDtoToJson(this);
  }

  OrderEntity toEntity() {
    return OrderEntity(
      orderId: id ?? '',
      orderNumber: orderNumber ?? '',
      orderItems:
          orderItems!
              .map(
                (orderItem) => OrderItemEntity(
                  product: ProductEntity(
                    id: orderItem.product?.productId ?? '',
                    title: orderItem.product?.title ?? '',
                    description: orderItem.product?.description ?? '',
                    images: orderItem.product?.images ?? [],
                    imgCover: orderItem.product?.imgCover ?? '',
                    price: orderItem.product?.price ?? 0,
                    quantity: orderItem.product?.quantity ?? 0,
                    category: orderItem.product?.category ?? '',
                    occasion: orderItem.product?.occasion ?? '',
                    createdAt: DateTime.parse(
                      orderItem.product?.createdAt ?? '',
                    ),
                    updatedAt: DateTime.parse(
                      orderItem.product?.updatedAt ?? '',
                    ),
                  ),
                  quantity: orderItem.quantity ?? 0,
                  price: orderItem.price ?? 0,
                  orderItemId: orderItem.id ?? '',
                ),
              )
              .toList(),
      totalPrice: totalPrice ?? 0,
      isPaid: isPaid ?? false,
      isDelivered: isDelivered ?? false,
      state: state ?? '',
    );
  }
}
