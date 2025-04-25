// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_text_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomTextDto _$CustomTextDtoFromJson(Map<String, dynamic> json) =>
    CustomTextDto(
      afterSubmit: json['after_submit'],
      shippingAddress: json['shipping_address'],
      submit: json['submit'],
      termsOfServiceAcceptance: json['terms_of_service_acceptance'],
    );

Map<String, dynamic> _$CustomTextDtoToJson(CustomTextDto instance) =>
    <String, dynamic>{
      'after_submit': instance.afterSubmit,
      'shipping_address': instance.shippingAddress,
      'submit': instance.submit,
      'terms_of_service_acceptance': instance.termsOfServiceAcceptance,
    };
