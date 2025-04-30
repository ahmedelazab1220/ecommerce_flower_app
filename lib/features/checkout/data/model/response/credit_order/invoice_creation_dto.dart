import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/invoice_creation_entity.dart';
import 'invoice_data_dto.dart';

part 'invoice_creation_dto.g.dart';

@JsonSerializable()
class InvoiceCreationDto {
  @JsonKey(name: "enabled")
  final bool? enabled;
  @JsonKey(name: "invoice_data")
  final InvoiceDataDto? invoiceData;

  InvoiceCreationDto({this.enabled, this.invoiceData});

  factory InvoiceCreationDto.fromJson(Map<String, dynamic> json) {
    return _$InvoiceCreationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InvoiceCreationDtoToJson(this);
  }

  InvoiceCreationEntity toEntity() => InvoiceCreationEntity(
    enabled: enabled,
    invoiceData: invoiceData?.toEntity(),
  );
}
