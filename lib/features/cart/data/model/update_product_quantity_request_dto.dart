import 'package:json_annotation/json_annotation.dart';

part 'update_product_quantity_request_dto.g.dart';

@JsonSerializable()
class UpdateProductQuantityRequestDto {
  @JsonKey(name: "quantity")
  final int? quantity;

  UpdateProductQuantityRequestDto({this.quantity});

  factory UpdateProductQuantityRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateProductQuantityRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateProductQuantityRequestDtoToJson(this);
  }
}
