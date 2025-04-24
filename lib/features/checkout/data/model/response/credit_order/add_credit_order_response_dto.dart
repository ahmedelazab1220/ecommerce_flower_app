import 'package:ecommerce_flower_app/features/checkout/data/model/response/credit_order/session.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_credit_order_response_dto.g.dart';

@JsonSerializable()
class AddCreditOrderResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "session")
  final Session? session;

  AddCreditOrderResponseDto({this.message, this.session});

  factory AddCreditOrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddCreditOrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCreditOrderResponseDtoToJson(this);
  }
}
