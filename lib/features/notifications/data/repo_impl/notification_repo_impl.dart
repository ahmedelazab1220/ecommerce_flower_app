import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/notifications/domain/entity/notifications_entity.dart';
import 'package:ecommerce_flower_app/features/notifications/domain/repo/notification_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_source/contract/notification_remote_data_source.dart';

@Injectable(as: NotificationRepo)
class NotificationRepoImpl implements NotificationRepo {
  final NotificationRemoteDataSource _notificationRemoteDataSource;
  final ApiManager _apiManager;
  NotificationRepoImpl(this._notificationRemoteDataSource, this._apiManager);
  @override
  Future<Result<List<NotificationsEntity>>> getAllNotifications() async {
    return await _apiManager.execute<List<NotificationsEntity>>(() async {
      final response =
          await _notificationRemoteDataSource.getAllNotifications();
      return response.notifications!.map((notification) {
        return notification.toEntity();
      }).toList();
    });
  }

  @override
  Future<Result<NotificationsEntity>> getNotificationById(String id) async {
    return await _apiManager.execute<NotificationsEntity>(() async {
      final response = await _notificationRemoteDataSource.getNotificationById(
        id,
      );
      return response.notification!.toEntity();
    });
  }

  @override
  Future<Result<void>> deleteNotification(String id) async {
    return await _apiManager.execute<void>(() async {
      await _notificationRemoteDataSource.deleteNotificationById(id);
    });
  }
}
