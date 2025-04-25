// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseDto _$AddToCartResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddToCartResponseDto(
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToCartResponseDtoToJson(
        AddToCartResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };
