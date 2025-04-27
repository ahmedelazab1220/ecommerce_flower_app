// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseDto _$OrderResponseDtoFromJson(Map<String, dynamic> json) =>
    OrderResponseDto(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => Orders.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$OrderResponseDtoToJson(OrderResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'orders': instance.orders,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalItems: (json['totalItems'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'totalPages': instance.totalPages,
  'limit': instance.limit,
  'totalItems': instance.totalItems,
};

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
  id: json['_id'] as String?,
  user: json['user'] as String?,
  orderItems:
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
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

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  productId: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  imgCover: json['imgCover'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  price: (json['price'] as num?)?.toInt(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  category: json['category'] as String?,
  occasion: json['occasion'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  sold: (json['sold'] as num?)?.toInt(),
  rateAvg: (json['rateAvg'] as num?)?.toDouble(),
  rateCount: (json['rateCount'] as num?)?.toInt(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  '_id': instance.productId,
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'imgCover': instance.imgCover,
  'images': instance.images,
  'price': instance.price,
  'priceAfterDiscount': instance.priceAfterDiscount,
  'quantity': instance.quantity,
  'category': instance.category,
  'occasion': instance.occasion,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
  'discount': instance.discount,
  'sold': instance.sold,
  'rateAvg': instance.rateAvg,
  'rateCount': instance.rateCount,
  'id': instance.id,
};
