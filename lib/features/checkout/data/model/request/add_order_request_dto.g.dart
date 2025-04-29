// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderRequestDto _$AddOrderRequestDtoFromJson(Map<String, dynamic> json) =>
    AddOrderRequestDto(
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddressDto.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOrderRequestDtoToJson(AddOrderRequestDto instance) =>
    <String, dynamic>{
      'shippingAddress': instance.shippingAddress,
    };
