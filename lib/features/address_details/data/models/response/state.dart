import 'package:ecommerce_flower_app/features/address_details/domain/entities/state_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class State {
  final String? id;
  @JsonKey(name: 'governorate_name_ar')
  final String? governorateNameAr;
  @JsonKey(name: 'governorate_name_en')
  final String? governorateNameEn;

  const State({this.id, this.governorateNameAr, this.governorateNameEn});

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);

  StateEntity toEntity() {
    return StateEntity(id, governorateNameAr, governorateNameEn);
  }
}
