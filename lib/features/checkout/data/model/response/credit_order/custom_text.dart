import 'package:json_annotation/json_annotation.dart';

part 'custom_text.g.dart';

@JsonSerializable()
class CustomText {
  @JsonKey(name: "after_submit")
  final dynamic afterSubmit;
  @JsonKey(name: "shipping_address")
  final dynamic shippingAddress;
  @JsonKey(name: "submit")
  final dynamic submit;
  @JsonKey(name: "terms_of_service_acceptance")
  final dynamic termsOfServiceAcceptance;

  CustomText({
    this.afterSubmit,
    this.shippingAddress,
    this.submit,
    this.termsOfServiceAcceptance,
  });

  factory CustomText.fromJson(Map<String, dynamic> json) {
    return _$CustomTextFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CustomTextToJson(this);
  }
}
