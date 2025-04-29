// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_info_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartInfoResponseDto _$GetCartInfoResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetCartInfoResponseDto(
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cart: json['cart'] == null
          ? null
          : CartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartInfoResponseDtoToJson(
        GetCartInfoResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };
