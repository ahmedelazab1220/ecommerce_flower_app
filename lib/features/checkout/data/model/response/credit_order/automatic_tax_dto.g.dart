// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'automatic_tax_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutomaticTaxDto _$AutomaticTaxDtoFromJson(Map<String, dynamic> json) =>
    AutomaticTaxDto(
      enabled: json['enabled'] as bool?,
      liability: json['liability'],
      provider: json['provider'],
      status: json['status'],
    );

Map<String, dynamic> _$AutomaticTaxDtoToJson(AutomaticTaxDto instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'liability': instance.liability,
      'provider': instance.provider,
      'status': instance.status,
    };
