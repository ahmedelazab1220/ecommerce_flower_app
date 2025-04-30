import 'package:ecommerce_flower_app/features/orders/data/model/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

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
}
