// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      address: json['address'],
      email: json['email'] as String?,
      name: json['name'],
      phone: json['phone'],
      taxExempt: json['tax_exempt'] as String?,
      taxIds: json['tax_ids'],
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'address': instance.address,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'tax_exempt': instance.taxExempt,
      'tax_ids': instance.taxIds,
    };
