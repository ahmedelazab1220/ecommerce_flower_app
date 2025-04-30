import 'package:json_annotation/json_annotation.dart';

import 'notifications.dart';

part 'delete_notification_by_id_response_dto.g.dart';

@JsonSerializable()
class DeleteNotificationByIdResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "document")
  final Notifications? document;

  DeleteNotificationByIdResponseDto({this.message, this.document});

  factory DeleteNotificationByIdResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$DeleteNotificationByIdResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteNotificationByIdResponseDtoToJson(this);
  }
}
