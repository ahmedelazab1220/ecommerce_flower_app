// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalDetailsDto _$TotalDetailsDtoFromJson(Map<String, dynamic> json) =>
    TotalDetailsDto(
      amountDiscount: (json['amount_discount'] as num?)?.toInt(),
      amountShipping: (json['amount_shipping'] as num?)?.toInt(),
      amountTax: (json['amount_tax'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TotalDetailsDtoToJson(TotalDetailsDto instance) =>
    <String, dynamic>{
      'amount_discount': instance.amountDiscount,
      'amount_shipping': instance.amountShipping,
      'amount_tax': instance.amountTax,
    };
