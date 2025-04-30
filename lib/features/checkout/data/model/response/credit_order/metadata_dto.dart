import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/metadata_entity.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "lat")
  final String? lat;
  @JsonKey(name: "long")
  final String? long;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "street")
  final String? street;

  MetadataDto({this.city, this.lat, this.long, this.phone, this.street});

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return _$MetadataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDtoToJson(this);
  }

  MetadataEntity toEntity() {
    return MetadataEntity(
      city: city,
      lat: lat,
      long: long,
      phone: phone,
      street: street,
    );
  }
}
