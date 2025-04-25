import 'package:ecommerce_flower_app/features/notifications/data/data_source/contract/notification_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/notifications/data/model/delete_notification_by_id_response_dto.dart';
import 'package:ecommerce_flower_app/features/notifications/data/model/get_all_notification_response_dto.dart';
import 'package:ecommerce_flower_app/features/notifications/data/model/get_notification_by_id_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../api/notification_retrofit_client.dart';

@Injectable(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  final NotificationRetrofitClient _notificationRetrofitClient;
  NotificationRemoteDataSourceImpl(this._notificationRetrofitClient);
  @override
  Future<GetAllNotificationResponseDto> getAllNotifications() async {
    return await _notificationRetrofitClient.getNotifications();
  }

  @override
  Future<GetNotificationByIdResponseDto> getNotificationById(String id) async {
    return await _notificationRetrofitClient.getNotificationsById(id);
  }

  @override
  Future<DeleteNotificationByIdResponseDto> deleteNotificationById(
    String id,
  ) async {
    return await _notificationRetrofitClient.deleteNotification(id);
  }
}
