import 'package:json_annotation/json_annotation.dart';

part 'adaptive_pricing.g.dart';

@JsonSerializable()
class AdaptivePricing {
  @JsonKey(name: "enabled")
  final bool? enabled;

  AdaptivePricing({this.enabled});

  factory AdaptivePricing.fromJson(Map<String, dynamic> json) {
    return _$AdaptivePricingFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdaptivePricingToJson(this);
  }
}
