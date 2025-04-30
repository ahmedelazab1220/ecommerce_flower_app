import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/cash_order_entity/add_cache_order_response_entity.dart';
import 'order_dto.dart';

part 'add_cache_order_response_dto.g.dart';

@JsonSerializable()
class AddCacheOrderResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "order")
  final OrderDto? order;

  AddCacheOrderResponseDto({this.message, this.order});

  factory AddCacheOrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddCacheOrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCacheOrderResponseDtoToJson(this);
  }

  AddCacheOrderResponseEntity toEntity() =>
      AddCacheOrderResponseEntity(message: message, order: order?.toEntity());
}
