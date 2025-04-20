import 'package:json_annotation/json_annotation.dart';

part 'automatic_tax.g.dart';

@JsonSerializable()
class AutomaticTax {
  @JsonKey(name: "enabled")
  final bool? enabled;
  @JsonKey(name: "liability")
  final dynamic? liability;
  @JsonKey(name: "provider")
  final dynamic? provider;
  @JsonKey(name: "status")
  final dynamic? status;

  AutomaticTax({this.enabled, this.liability, this.provider, this.status});

  factory AutomaticTax.fromJson(Map<String, dynamic> json) {
    return _$AutomaticTaxFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AutomaticTaxToJson(this);
  }
}
