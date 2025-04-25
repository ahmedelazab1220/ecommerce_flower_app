import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/invoice_data_entity.dart';
import 'metadata_dto.dart';

part 'invoice_data_dto.g.dart';

@JsonSerializable()
class InvoiceDataDto {
  @JsonKey(name: "account_tax_ids")
  final dynamic accountTaxIds;
  @JsonKey(name: "custom_fields")
  final dynamic customFields;
  @JsonKey(name: "description")
  final dynamic description;
  @JsonKey(name: "footer")
  final dynamic footer;
  @JsonKey(name: "issuer")
  final dynamic issuer;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "rendering_options")
  final dynamic renderingOptions;

  InvoiceDataDto({
    this.accountTaxIds,
    this.customFields,
    this.description,
    this.footer,
    this.issuer,
    this.metadata,
    this.renderingOptions,
  });

  factory InvoiceDataDto.fromJson(Map<String, dynamic> json) {
    return _$InvoiceDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InvoiceDataDtoToJson(this);
  }

  InvoiceDataEntity toEntity() => InvoiceDataEntity(
    accountTaxIds: accountTaxIds,
    customFields: customFields,
    description: description,
    footer: footer,
    issuer: issuer,
    metadata: metadata?.toEntity(),
    renderingOptions: renderingOptions,
  );
}
