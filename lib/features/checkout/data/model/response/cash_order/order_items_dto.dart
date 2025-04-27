import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/cash_order_entity/order_items_entity.dart';
import '../product_dto.dart';

part 'order_items_dto.g.dart';

@JsonSerializable()
class OrderItemsDto {
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? id;

  OrderItemsDto({this.product, this.price, this.quantity, this.id});

  factory OrderItemsDto.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsDtoToJson(this);
  }

  OrderItemsEntity toEntity() => OrderItemsEntity(
    product: product?.toEntity(),
    price: price,
    quantity: quantity,
    id: id,
  );
}
