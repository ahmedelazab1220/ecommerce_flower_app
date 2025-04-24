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
