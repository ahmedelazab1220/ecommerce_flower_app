import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/utils/shared_models/product_entity.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  @JsonKey(name: "rateAvg")
  final int? rateAvg;
  @JsonKey(name: "rateCount")
  final int? rateCount;
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
  final int? V;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "id")
  final String? id;

  ProductDto({
    this.rateAvg,
    this.rateCount,
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
    this.V,
    this.discount,
    this.sold,
    this.id,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductDtoToJson(this);
  }

  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    description: description,
    imgCover: imgCover,
    images: images,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    quantity: quantity,
    discount: discount,
    sold: sold,
    rateAvg: rateAvg,
    rateCount: rateCount,
    productId: productId,
    category: category,
    occasion: occasion,
    createdAt: DateTime.tryParse(createdAt ?? ''),
    updatedAt: DateTime.tryParse(updatedAt ?? ''),
    v: V,
    slug: slug,
  );
}
