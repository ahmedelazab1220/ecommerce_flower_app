import 'package:json_annotation/json_annotation.dart';

import 'best_seller_product.dart';

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
