import 'package:json_annotation/json_annotation.dart';

import 'invoice_data.dart';

part 'invoice_creation.g.dart';

@JsonSerializable()
class InvoiceCreation {
  @JsonKey(name: "enabled")
  final bool? enabled;
  @JsonKey(name: "invoice_data")
  final InvoiceData? invoiceData;

  InvoiceCreation({this.enabled, this.invoiceData});

  factory InvoiceCreation.fromJson(Map<String, dynamic> json) {
    return _$InvoiceCreationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InvoiceCreationToJson(this);
  }
}
