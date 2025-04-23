import 'package:json_annotation/json_annotation.dart';

part 'customer_details.g.dart';

@JsonSerializable()
class CustomerDetails {
  @JsonKey(name: "address")
  final dynamic address;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "name")
  final dynamic name;
  @JsonKey(name: "phone")
  final dynamic phone;
  @JsonKey(name: "tax_exempt")
  final String? taxExempt;
  @JsonKey(name: "tax_ids")
  final dynamic taxIds;

  CustomerDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.taxExempt,
    this.taxIds,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return _$CustomerDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CustomerDetailsToJson(this);
  }
}
