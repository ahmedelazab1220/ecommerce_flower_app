import '../../model/delete_notification_by_id_response_dto.dart';
import '../../model/get_all_notification_response_dto.dart';
import '../../model/get_notification_by_id_response_dto.dart';

abstract class NotificationRemoteDataSource {
  Future<GetAllNotificationResponseDto> getAllNotifications();
  Future<GetNotificationByIdResponseDto> getNotificationById(String id);
  Future<DeleteNotificationByIdResponseDto> deleteNotificationById(String id);
}
