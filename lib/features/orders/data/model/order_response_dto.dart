import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/order_entity.dart';

part 'order_response_dto.g.dart';

@JsonSerializable()
class OrderResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "orders")
  final List<Orders>? orders;

  OrderResponseDto({this.message, this.metadata, this.orders});

  factory OrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderResponseDtoToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  Metadata({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Orders {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "orderItems")
  final List<OrderItems>? orderItems;
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

  Orders({
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

  factory Orders.fromJson(Map<String, dynamic> json) {
    return _$OrdersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersToJson(this);
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

@JsonSerializable()
class OrderItems {
  @JsonKey(name: "product")
  final Product? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? id;

  OrderItems({this.product, this.price, this.quantity, this.id});

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsToJson(this);
  }
}

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  final String? productId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imgCover")
  final String? imgCover;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "occasion")
  final String? occasion;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "rateAvg")
  final double? rateAvg;
  @JsonKey(name: "rateCount")
  final int? rateCount;
  @JsonKey(name: "id")
  final String? id;

  Product({
    this.productId,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}
