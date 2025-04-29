import 'package:ecommerce_flower_app/features/search/data/model/metadata_dto.dart';
import 'package:ecommerce_flower_app/features/search/data/model/products_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response_dto.g.dart';

@JsonSerializable()
class SearchResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "products")
  final List<ProductsDto>? products;

  SearchResponseDto({this.message, this.metadata, this.products});

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SearchResponseDtoToJson(this);
  }
}
