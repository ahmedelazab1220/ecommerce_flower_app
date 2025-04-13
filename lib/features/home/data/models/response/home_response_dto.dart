import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/home_response_entity.dart';
import 'best_seller_dto.dart';
import 'category_dto.dart';
import 'occasion_dto.dart';
import 'product_dto.dart';

part 'home_response_dto.g.dart';

@JsonSerializable()
class HomeResponseDto {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'products')
  final List<ProductDto>? products;
  @JsonKey(name: 'categories')
  final List<CategoryDto>? categories;
  @JsonKey(name: 'bestSeller')
  final List<BestSellerDto>? bestSeller;
  @JsonKey(name: 'occasions')
  final List<OccasionDto>? occasions;

  HomeResponseDto({
    this.message,
    this.products,
    this.categories,
    this.bestSeller,
    this.occasions,
  });

  factory HomeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseDtoToJson(this);

  HomeResponseEntity toEntity() => HomeResponseEntity(
    message: message,
    products: products?.map((e) => e.toEntity()).toList(),
    categories: categories?.map((e) => e.toEntity()).toList(),
    bestSeller: bestSeller?.map((e) => e.toEntity()).toList(),
    occasions: occasions?.map((e) => e.toEntity()).toList(),
  );
}
