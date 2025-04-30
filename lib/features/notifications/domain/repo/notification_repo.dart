import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/notification_entity.dart';

abstract class NotificationRepo {
  Future<Result<List<NotificationEntity>>> getAllNotifications();
  Future<Result<NotificationEntity>> getNotificationById(String id);
  Future<Result<void>> deleteNotification(String id);
}
