import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/custom_text_entity.dart';

part 'custom_text_dto.g.dart';

@JsonSerializable()
class CustomTextDto {
  @JsonKey(name: "after_submit")
  final dynamic afterSubmit;
  @JsonKey(name: "shipping_address")
  final dynamic shippingAddress;
  @JsonKey(name: "submit")
  final dynamic submit;
  @JsonKey(name: "terms_of_service_acceptance")
  final dynamic termsOfServiceAcceptance;

  CustomTextDto({
    this.afterSubmit,
    this.shippingAddress,
    this.submit,
    this.termsOfServiceAcceptance,
  });

  factory CustomTextDto.fromJson(Map<String, dynamic> json) {
    return _$CustomTextDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CustomTextDtoToJson(this);
  }

  CustomTextEntity toEntity() => CustomTextEntity(
    afterSubmit: afterSubmit,
    shippingAddress: shippingAddress,
    submit: submit,
    termsOfServiceAcceptance: termsOfServiceAcceptance,
  );
}
