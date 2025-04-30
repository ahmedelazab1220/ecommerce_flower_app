import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import 'notifications.dart';

part 'get_all_notification_response_dto.g.dart';

@JsonSerializable()
class GetAllNotificationResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "notifications")
  final List<Notifications>? notifications;

  GetAllNotificationResponseDto({
    this.message,
    this.metadata,
    this.notifications,
  });

  factory GetAllNotificationResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetAllNotificationResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllNotificationResponseDtoToJson(this);
  }
}
