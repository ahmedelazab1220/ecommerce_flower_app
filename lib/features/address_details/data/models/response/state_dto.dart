import 'package:ecommerce_flower_app/features/address_details/domain/entities/state_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state_dto.g.dart';

@JsonSerializable()
class StateDto {
  final String? id;
  @JsonKey(name: 'governorate_name_ar')
  final String? governorateNameAr;
  @JsonKey(name: 'governorate_name_en')
  final String? governorateNameEn;

  const StateDto({this.id, this.governorateNameAr, this.governorateNameEn});

  factory StateDto.fromJson(Map<String, dynamic> json) =>
      _$StateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StateDtoToJson(this);

  StateEntity toEntity() {
    return StateEntity(id, governorateNameAr, governorateNameEn);
  }
}
