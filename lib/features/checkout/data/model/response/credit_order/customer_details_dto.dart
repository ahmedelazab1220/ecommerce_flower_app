import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/customer_details_entity.dart';

part 'customer_details_dto.g.dart';

@JsonSerializable()
class CustomerDetailsDto {
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

  CustomerDetailsDto({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.taxExempt,
    this.taxIds,
  });

  factory CustomerDetailsDto.fromJson(Map<String, dynamic> json) {
    return _$CustomerDetailsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CustomerDetailsDtoToJson(this);
  }

  CustomerDetailsEntity toEntity() => CustomerDetailsEntity(
    address: address,
    email: email,
    name: name,
    phone: phone,
    taxExempt: taxExempt,
    taxIds: taxIds,
  );
}
