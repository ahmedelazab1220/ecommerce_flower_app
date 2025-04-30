import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../domain/entity/notification_entity.dart';
import '../../domain/repo/notification_repo.dart';
import '../data_source/contract/notification_remote_data_source.dart';

@Injectable(as: NotificationRepo)
class NotificationRepoImpl implements NotificationRepo {
  final NotificationRemoteDataSource _notificationRemoteDataSource;
  final ApiManager _apiManager;
  NotificationRepoImpl(this._notificationRemoteDataSource, this._apiManager);
  @override
  Future<Result<List<NotificationEntity>>> getAllNotifications() async {
    return await _apiManager.execute<List<NotificationEntity>>(() async {
      final response =
          await _notificationRemoteDataSource.getAllNotifications();
      return response.notifications!.map((notification) {
        return notification.toEntity();
      }).toList();
    });
  }

  @override
  Future<Result<NotificationEntity>> getNotificationById(String id) async {
    return await _apiManager.execute<NotificationEntity>(() async {
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
