import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/notifications_entity.dart';
import '../repo/notification_repo.dart';

@injectable
class GetAllNotificationsUseCase {
  final NotificationRepo _notificationRepo;

  GetAllNotificationsUseCase(this._notificationRepo);

  Future<Result<List<NotificationsEntity>>> call() async {
    return await _notificationRepo.getAllNotifications();
  }
}
