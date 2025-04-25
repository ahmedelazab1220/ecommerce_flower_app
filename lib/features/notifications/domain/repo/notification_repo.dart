import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import '../entity/notifications_entity.dart';

abstract class NotificationRepo {
  Future<Result<List<NotificationsEntity>>> getAllNotifications();
  Future<Result<NotificationsEntity>> getNotificationById(String id);
  Future<Result<void>> deleteNotification(String id);
}
