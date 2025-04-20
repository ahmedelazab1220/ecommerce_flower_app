import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
  @JsonKey(name: "request_three_d_secure")
  final String? requestThreeDSecure;

  Card({this.requestThreeDSecure});

  factory Card.fromJson(Map<String, dynamic> json) {
    return _$CardFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CardToJson(this);
  }
}
