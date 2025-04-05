import 'package:ecommerce_flower_app/features/occasions/domain/entity/occasions_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'occasions_response_dto.g.dart';

@JsonSerializable()
class OccasionsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "occasions")
  final List<Occasions>? occasions;

  OccasionsResponseDto({this.message, this.metadata, this.occasions});

  factory OccasionsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OccasionsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsResponseDtoToJson(this);
  }

  OccasionsEntity toEntity() {
    return OccasionsEntity(
      message: message,
      occasions: occasions?.map((occasion) => occasion.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  Metadata({this.currentPage, this.limit, this.totalPages, this.totalItems});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Occasions {
  @JsonKey(name: "_id")
  final String? Id;
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

  Occasions({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  factory Occasions.fromJson(Map<String, dynamic> json) {
    return _$OccasionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsToJson(this);
  }

  OccasionEntity toEntity() {
    return OccasionEntity(name: name);
  }
}
