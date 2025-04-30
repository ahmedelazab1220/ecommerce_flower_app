import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/adaptive_pricing_entity.dart';

part 'adaptive_pricing_dto.g.dart';

@JsonSerializable()
class AdaptivePricingDto {
  @JsonKey(name: "enabled")
  final bool? enabled;

  AdaptivePricingDto({this.enabled});

  factory AdaptivePricingDto.fromJson(Map<String, dynamic> json) {
    return _$AdaptivePricingDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdaptivePricingDtoToJson(this);
  }

  AdaptivePricingEntity toEntity() => AdaptivePricingEntity(enabled: enabled);
}
