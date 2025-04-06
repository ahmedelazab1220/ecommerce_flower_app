import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "products")
  final List<Products>? products;

  ProductsModel({this.message, this.metadata, this.products});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return _$ProductsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsModelToJson(this);
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
class Products {
  @JsonKey(name: "_id")
  final String? Id;
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
  @JsonKey(name: "rateAvg")
  final double? rateAvg;
  @JsonKey(name: "rateCount")
  final int? rateCount;
  @JsonKey(name: "id")
  final String? id;

  Products({
    this.Id,
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
    this.rateAvg,
    this.rateCount,
    this.id,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsToJson(this);
  }
}
