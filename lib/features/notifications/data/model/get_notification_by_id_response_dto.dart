import 'package:json_annotation/json_annotation.dart';

import 'notifications.dart';

part 'get_notification_by_id_response_dto.g.dart';

@JsonSerializable()
class GetNotificationByIdResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "notification")
  final Notifications? notification;

  GetNotificationByIdResponseDto({this.message, this.notification});

  factory GetNotificationByIdResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetNotificationByIdResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetNotificationByIdResponseDtoToJson(this);
  }
}
