import 'package:json_annotation/json_annotation.dart';

import 'product_dto.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final String? message;
  final List<ProductDto>? products;

  const ProductsResponse({required this.message, required this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
