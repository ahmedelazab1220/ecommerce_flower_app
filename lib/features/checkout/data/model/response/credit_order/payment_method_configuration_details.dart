import 'package:json_annotation/json_annotation.dart';

part 'payment_method_configuration_details.g.dart';

@JsonSerializable()
class PaymentMethodConfigurationDetails {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "parent")
  final dynamic? parent;

  PaymentMethodConfigurationDetails({this.id, this.parent});

  factory PaymentMethodConfigurationDetails.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$PaymentMethodConfigurationDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaymentMethodConfigurationDetailsToJson(this);
  }
}
