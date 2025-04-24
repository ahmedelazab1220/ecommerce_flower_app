import 'package:json_annotation/json_annotation.dart';

import 'order.dart';

part 'add_cache_order_response_dto.g.dart';

@JsonSerializable()
class AddCacheOrderResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "order")
  final Order? order;

  AddCacheOrderResponseDto({this.message, this.order});

  factory AddCacheOrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddCacheOrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCacheOrderResponseDtoToJson(this);
  }
}
