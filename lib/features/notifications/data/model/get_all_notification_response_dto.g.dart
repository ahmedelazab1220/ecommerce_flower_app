// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotificationResponseDto _$GetAllNotificationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetAllNotificationResponseDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => Notifications.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllNotificationResponseDtoToJson(
        GetAllNotificationResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'notifications': instance.notifications,
    };
