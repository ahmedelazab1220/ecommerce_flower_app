import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/category_entity.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? productsCount;

  const CategoryDto({
    required this.id,
    required this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return _$CategoryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name);
  }
}
