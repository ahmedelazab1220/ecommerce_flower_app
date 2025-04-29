// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_creation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceCreationDto _$InvoiceCreationDtoFromJson(Map<String, dynamic> json) =>
    InvoiceCreationDto(
      enabled: json['enabled'] as bool?,
      invoiceData: json['invoice_data'] == null
          ? null
          : InvoiceDataDto.fromJson(
              json['invoice_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvoiceCreationDtoToJson(InvoiceCreationDto instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'invoice_data': instance.invoiceData,
    };
