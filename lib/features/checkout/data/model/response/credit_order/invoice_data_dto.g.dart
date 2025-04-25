// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDataDto _$InvoiceDataDtoFromJson(Map<String, dynamic> json) =>
    InvoiceDataDto(
      accountTaxIds: json['account_tax_ids'],
      customFields: json['custom_fields'],
      description: json['description'],
      footer: json['footer'],
      issuer: json['issuer'],
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      renderingOptions: json['rendering_options'],
    );

Map<String, dynamic> _$InvoiceDataDtoToJson(InvoiceDataDto instance) =>
    <String, dynamic>{
      'account_tax_ids': instance.accountTaxIds,
      'custom_fields': instance.customFields,
      'description': instance.description,
      'footer': instance.footer,
      'issuer': instance.issuer,
      'metadata': instance.metadata,
      'rendering_options': instance.renderingOptions,
    };
