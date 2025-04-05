// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerProducts _$BestSellerProductsFromJson(Map<String, dynamic> json) =>
    BestSellerProducts(
      message: json['message'] as String?,
      bestSeller: (json['bestSeller'] as List<dynamic>?)
          ?.map((e) => BestSellerProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BestSellerProductsToJson(BestSellerProducts instance) =>
    <String, dynamic>{
      'message': instance.message,
      'bestSeller': instance.bestSeller,
    };

BestSellerProduct _$BestSellerProductFromJson(Map<String, dynamic> json) =>
    BestSellerProduct(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      imgCover: json['imgCover'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
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

Map<String, dynamic> _$BestSellerProductToJson(BestSellerProduct instance) =>
    <String, dynamic>{
      '_id': instance.Id,
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
