import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';

part 'invoice_data.g.dart';

@JsonSerializable()
class InvoiceData {
  @JsonKey(name: "account_tax_ids")
  final dynamic? accountTaxIds;
  @JsonKey(name: "custom_fields")
  final dynamic? customFields;
  @JsonKey(name: "description")
  final dynamic? description;
  @JsonKey(name: "footer")
  final dynamic? footer;
  @JsonKey(name: "issuer")
  final dynamic? issuer;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "rendering_options")
  final dynamic? renderingOptions;

  InvoiceData({
    this.accountTaxIds,
    this.customFields,
    this.description,
    this.footer,
    this.issuer,
    this.metadata,
    this.renderingOptions,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) {
    return _$InvoiceDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InvoiceDataToJson(this);
  }
}
