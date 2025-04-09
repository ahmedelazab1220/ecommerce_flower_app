import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/occasion_entity.dart';

part 'occasion_dto.g.dart';

@JsonSerializable()
class OccasionDto {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  OccasionDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory OccasionDto.fromJson(Map<String, dynamic> json) =>
      _$OccasionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OccasionDtoToJson(this);

  OccasionEntity toEntity() => OccasionEntity(
    id: id,
    name: name,
    slug: slug,
    image: image,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
