import 'package:json_annotation/json_annotation.dart';

import 'card.dart';

part 'payment_method_options.g.dart';

@JsonSerializable()
class PaymentMethodOptions {
  @JsonKey(name: "card")
  final Card? card;

  PaymentMethodOptions({this.card});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return _$PaymentMethodOptionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaymentMethodOptionsToJson(this);
  }
}
