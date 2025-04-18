import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/occasion_entity.dart';

part 'occasion_dto.g.dart';

@JsonSerializable()
class OccasionDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "productsCount")
  final int? productsCount;

  OccasionDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  factory OccasionDto.fromJson(Map<String, dynamic> json) {
    return _$OccasionDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionDtoToJson(this);
  }

  OccasionEntity toEntity() {
    return OccasionEntity(id: id, name: name);
  }
}
