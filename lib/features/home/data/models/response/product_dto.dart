import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/product_entity.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'imgCover')
  final String? imgCover;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'price')
  final num? price;
  @JsonKey(name: 'priceAfterDiscount')
  final num? priceAfterDiscount;
  @JsonKey(name: 'quantity')
  final num? quantity;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'occasion')
  final String? occasion;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final num? v;
  @JsonKey(name: 'discount')
  final num? discount;
  @JsonKey(name: 'sold')
  final num? sold;
  @JsonKey(name: 'rateAvg')
  final num? rateAvg;
  @JsonKey(name: 'rateCount')
  final num? rateCount;
  @JsonKey(name: 'id')
  final String? productId;

  ProductDto({
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

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    slug: slug,
    description: description,
    imgCover: imgCover,
    images: images,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    quantity: quantity,
    category: category,
    occasion: occasion,
    createdAt: createdAt,
    updatedAt: updatedAt,
    v: v,
    discount: discount,
    sold: sold,
    rateAvg: rateAvg,
    rateCount: rateCount,
    productId: productId,
  );
}
