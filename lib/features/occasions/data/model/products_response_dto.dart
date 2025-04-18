import 'package:json_annotation/json_annotation.dart';

import 'meta_data_dto.dart';
import 'product_dto.dart';

part 'products_response_dto.g.dart';

@JsonSerializable()
class ProductsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "products")
  final List<ProductDto>? products;

  ProductsResponseDto({this.message, this.metadata, this.products});

  factory ProductsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsResponseDtoToJson(this);
  }
}
