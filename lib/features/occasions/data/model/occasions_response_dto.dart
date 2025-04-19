import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/occasions_response_entity.dart';
import 'meta_data_dto.dart';
import 'occasion_dto.dart';

part 'occasions_response_dto.g.dart';

@JsonSerializable()
class OccasionsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "occasions")
  final List<OccasionDto>? occasions;

  OccasionsResponseDto({this.message, this.metadata, this.occasions});

  factory OccasionsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OccasionsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsResponseDtoToJson(this);
  }

  OccasionResponseEntity toEntity() {
    return OccasionResponseEntity(
      message: message,
      occasions: occasions?.map((occasion) => occasion.toEntity()).toList(),
    );
  }
}
