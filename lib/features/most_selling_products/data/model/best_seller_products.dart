import 'package:ecommerce_flower_app/features/most_selling_products/domain/entity/best_seller_product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller_products.g.dart';

@JsonSerializable()
class BestSellerProducts {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "bestSeller")
  final List<BestSellerProduct>? bestSeller;

  BestSellerProducts({this.message, this.bestSeller});

  factory BestSellerProducts.fromJson(Map<String, dynamic> json) {
    return _$BestSellerProductsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BestSellerProductsToJson(this);
  }
}

@JsonSerializable()
class BestSellerProduct {
  @JsonKey(name: "_id")
  final String? id;
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
  final String? productId;

  BestSellerProduct({
    this.id,
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
    this.productId,
  });

  factory BestSellerProduct.fromJson(Map<String, dynamic> json) {
    return _$BestSellerProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BestSellerProductToJson(this);
  }

  BestSellerProductEntity toEntity() {
    return BestSellerProductEntity(
      title: title ?? '',
      imgCover: imgCover ?? '',
      price: price ?? 0,
      priceAfterDiscount: priceAfterDiscount ?? 0,
      discount: discount ?? 0,
    );
  }
}
