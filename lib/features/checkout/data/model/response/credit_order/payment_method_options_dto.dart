import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/payment_method_options_entity.dart';
import 'card_dto.dart';

part 'payment_method_options_dto.g.dart';

@JsonSerializable()
class PaymentMethodOptionsDto {
  @JsonKey(name: "card")
  final CardDto? card;

  PaymentMethodOptionsDto({this.card});

  factory PaymentMethodOptionsDto.fromJson(Map<String, dynamic> json) {
    return _$PaymentMethodOptionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaymentMethodOptionsDtoToJson(this);
  }

  PaymentMethodOptionsEntity toEntity() {
    return PaymentMethodOptionsEntity(card: card?.toEntity());
  }
}
