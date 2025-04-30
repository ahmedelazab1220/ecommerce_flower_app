// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_notification_by_id_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteNotificationByIdResponseDto _$DeleteNotificationByIdResponseDtoFromJson(
  Map<String, dynamic> json,
) => DeleteNotificationByIdResponseDto(
  message: json['message'] as String?,
  document:
      json['document'] == null
          ? null
          : NotificationDto.fromJson(json['document'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteNotificationByIdResponseDtoToJson(
  DeleteNotificationByIdResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'document': instance.document,
};
