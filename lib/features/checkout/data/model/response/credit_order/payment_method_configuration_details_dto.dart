import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/payment_method_configuration_details_entity.dart';

part 'payment_method_configuration_details_dto.g.dart';

@JsonSerializable()
class PaymentMethodConfigurationDetailsDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "parent")
  final dynamic parent;

  PaymentMethodConfigurationDetailsDto({this.id, this.parent});

  factory PaymentMethodConfigurationDetailsDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$PaymentMethodConfigurationDetailsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaymentMethodConfigurationDetailsDtoToJson(this);
  }

  PaymentMethodConfigurationDetailsEntity toEntity() {
    return PaymentMethodConfigurationDetailsEntity(id: id, parent: parent);
  }
}
