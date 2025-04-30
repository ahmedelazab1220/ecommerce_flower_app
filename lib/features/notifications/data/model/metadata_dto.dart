import 'package:json_annotation/json_annotation.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  MetadataDto({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory MetadataDto.fromJson(Map<String, dynamic> json) =>
      _$MetadataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataDtoToJson(this);
}
