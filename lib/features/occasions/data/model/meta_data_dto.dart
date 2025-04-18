import 'package:json_annotation/json_annotation.dart';

part 'meta_data_dto.g.dart';

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  MetadataDto({this.currentPage, this.limit, this.totalPages, this.totalItems});

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return _$MetadataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDtoToJson(this);
  }
}
