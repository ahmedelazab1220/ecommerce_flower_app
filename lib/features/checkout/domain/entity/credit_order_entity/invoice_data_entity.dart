import 'metadata_entity.dart';

class InvoiceDataEntity {
  final dynamic accountTaxIds;
  final dynamic customFields;
  final dynamic description;
  final dynamic footer;
  final dynamic issuer;
  final MetadataEntity? metadata;
  final dynamic renderingOptions;

  InvoiceDataEntity({
    this.accountTaxIds,
    this.customFields,
    this.description,
    this.footer,
    this.issuer,
    this.metadata,
    this.renderingOptions,
  });
}
