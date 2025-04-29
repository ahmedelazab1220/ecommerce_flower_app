// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_credit_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCreditOrderResponseDto _$AddCreditOrderResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddCreditOrderResponseDto(
      message: json['message'] as String?,
      session: json['session'] == null
          ? null
          : SessionDto.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCreditOrderResponseDtoToJson(
        AddCreditOrderResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'session': instance.session,
    };
