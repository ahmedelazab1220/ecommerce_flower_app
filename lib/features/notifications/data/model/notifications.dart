import 'package:ecommerce_flower_app/features/notifications/domain/entity/notifications_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable()
class Notifications {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? V;

  Notifications({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.V,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return _$NotificationsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NotificationsToJson(this);
  }

  NotificationsEntity toEntity() {
    return NotificationsEntity(id: id, title: title, body: body);
  }
}
