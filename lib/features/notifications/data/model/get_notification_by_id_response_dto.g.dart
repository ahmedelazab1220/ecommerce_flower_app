// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notification_by_id_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationByIdResponseDto _$GetNotificationByIdResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetNotificationByIdResponseDto(
      message: json['message'] as String?,
      notification: json['notification'] == null
          ? null
          : Notifications.fromJson(
              json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetNotificationByIdResponseDtoToJson(
        GetNotificationByIdResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'notification': instance.notification,
    };
