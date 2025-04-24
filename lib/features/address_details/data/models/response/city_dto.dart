import 'package:ecommerce_flower_app/features/address_details/domain/entities/city_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_dto.g.dart';

@JsonSerializable()
class CityDto {
  final String? id;
  @JsonKey(name: 'governorate_id')
  final String? governorateId;
  @JsonKey(name: 'city_name_ar')
  final String? cityNameAr;
  @JsonKey(name: 'city_name_en')
  final String? cityNameEn;

  const CityDto({
    this.id,
    this.governorateId,
    this.cityNameAr,
    this.cityNameEn,
  });

  factory CityDto.fromJson(Map<String, dynamic> json) =>
      _$CityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CityDtoToJson(this);

  CityEntity toEntity() {
    return CityEntity(id, governorateId, cityNameAr, cityNameEn);
  }
}
