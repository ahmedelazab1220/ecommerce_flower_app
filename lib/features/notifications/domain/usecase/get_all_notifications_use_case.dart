import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/notification_entity.dart';
import '../repo/notification_repo.dart';

@injectable
class GetAllNotificationsUseCase {
  final NotificationRepo _notificationRepo;

  GetAllNotificationsUseCase(this._notificationRepo);

  Future<Result<List<NotificationEntity>>> call() async {
    return await _notificationRepo.getAllNotifications();
  }
}
