// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseDto _$SearchResponseDtoFromJson(Map<String, dynamic> json) =>
    SearchResponseDto(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SearchResponseDtoToJson(SearchResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'products': instance.products,
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

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
  rateAvg: (json['rateAvg'] as num?)?.toInt(),
  rateCount: (json['rateCount'] as num?)?.toInt(),
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
  id: json['id'] as String?,
);

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
  'rateAvg': instance.rateAvg,
  'rateCount': instance.rateCount,
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
  'id': instance.id,
};
