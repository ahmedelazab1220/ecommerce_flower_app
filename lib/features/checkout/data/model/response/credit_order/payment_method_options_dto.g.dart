// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_options_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodOptionsDto _$PaymentMethodOptionsDtoFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodOptionsDto(
      card: json['card'] == null
          ? null
          : CardDto.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentMethodOptionsDtoToJson(
        PaymentMethodOptionsDto instance) =>
    <String, dynamic>{
      'card': instance.card,
    };
