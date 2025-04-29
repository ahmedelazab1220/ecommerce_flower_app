import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/automatic_tax_entity.dart';

part 'automatic_tax_dto.g.dart';

@JsonSerializable()
class AutomaticTaxDto {
  @JsonKey(name: "enabled")
  final bool? enabled;
  @JsonKey(name: "liability")
  final dynamic liability;
  @JsonKey(name: "provider")
  final dynamic provider;
  @JsonKey(name: "status")
  final dynamic status;

  AutomaticTaxDto({this.enabled, this.liability, this.provider, this.status});

  factory AutomaticTaxDto.fromJson(Map<String, dynamic> json) {
    return _$AutomaticTaxDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AutomaticTaxDtoToJson(this);
  }

  AutomaticTaxEntity toEntity() => AutomaticTaxEntity(
    enabled: enabled,
    liability: liability,
    provider: provider,
    status: status,
  );
}
