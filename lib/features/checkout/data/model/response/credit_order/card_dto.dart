import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/card_entity.dart';

part 'card_dto.g.dart';

@JsonSerializable()
class CardDto {
  @JsonKey(name: "request_three_d_secure")
  final String? requestThreeDSecure;

  CardDto({this.requestThreeDSecure});

  factory CardDto.fromJson(Map<String, dynamic> json) {
    return _$CardDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CardDtoToJson(this);
  }

  CardEntity toEntity() => CardEntity(requestThreeDSecure: requestThreeDSecure);
}
