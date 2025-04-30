import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/add_credit_order_response_entity.dart';
import 'session_dto.dart';

part 'add_credit_order_response_dto.g.dart';

@JsonSerializable()
class AddCreditOrderResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "session")
  final SessionDto? session;

  AddCreditOrderResponseDto({this.message, this.session});

  factory AddCreditOrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddCreditOrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCreditOrderResponseDtoToJson(this);
  }

  AddCreditOrderResponseEntity toEntity() {
    return AddCreditOrderResponseEntity(
      message: message,
      session: session?.toEntity(),
    );
  }
}
