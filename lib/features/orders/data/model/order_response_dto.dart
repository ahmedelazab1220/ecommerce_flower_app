import 'package:ecommerce_flower_app/features/orders/data/model/orders_dto.dart';
import 'package:ecommerce_flower_app/features/orders/data/model/metadata_dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'order_response_dto.g.dart';

@JsonSerializable()
class OrderResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "orders")
  final List<OrdersDto>? orders;

  OrderResponseDto({this.message, this.metadata, this.orders});

  factory OrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderResponseDtoToJson(this);
  }
}
