import 'package:json_annotation/json_annotation.dart';

part 'total_details.g.dart';

@JsonSerializable()
class TotalDetails {
  @JsonKey(name: "amount_discount")
  final int? amountDiscount;
  @JsonKey(name: "amount_shipping")
  final int? amountShipping;
  @JsonKey(name: "amount_tax")
  final int? amountTax;

  TotalDetails({this.amountDiscount, this.amountShipping, this.amountTax});

  factory TotalDetails.fromJson(Map<String, dynamic> json) {
    return _$TotalDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TotalDetailsToJson(this);
  }
}
