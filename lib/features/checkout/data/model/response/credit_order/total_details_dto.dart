import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/total_details_entity.dart';

part 'total_details_dto.g.dart';

@JsonSerializable()
class TotalDetailsDto {
  @JsonKey(name: "amount_discount")
  final int? amountDiscount;
  @JsonKey(name: "amount_shipping")
  final int? amountShipping;
  @JsonKey(name: "amount_tax")
  final int? amountTax;

  TotalDetailsDto({this.amountDiscount, this.amountShipping, this.amountTax});

  factory TotalDetailsDto.fromJson(Map<String, dynamic> json) {
    return _$TotalDetailsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TotalDetailsDtoToJson(this);
  }

  TotalDetailsEntity toEntity() => TotalDetailsEntity(
    amountDiscount: amountDiscount,
    amountShipping: amountShipping,
    amountTax: amountTax,
  );
}
