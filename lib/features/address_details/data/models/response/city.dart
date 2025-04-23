import 'package:ecommerce_flower_app/features/address_details/domain/entities/city_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final String? id;
  @JsonKey(name: 'governorate_id')
  final String? governorateId;
  @JsonKey(name: 'city_name_ar')
  final String? cityNameAr;
  @JsonKey(name: 'city_name_en')
  final String? cityNameEn;

  const City({this.id, this.governorateId, this.cityNameAr, this.cityNameEn});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  CityEntity toEntity() {
    return CityEntity(id, governorateId, cityNameAr, cityNameEn);
  }
}
