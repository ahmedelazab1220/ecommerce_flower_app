import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/utils/shared_models/product_entity.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  final int? rateAvg;
  final int? rateCount;
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  final int? discount;
  final int? sold;

  const ProductDto({
    this.rateAvg,
    this.rateCount,
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
    this.id,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      discount: discount,
      sold: sold,
    );
  }
}
