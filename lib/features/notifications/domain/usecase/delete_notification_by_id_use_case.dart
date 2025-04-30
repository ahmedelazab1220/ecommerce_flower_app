import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../repo/notification_repo.dart';

@injectable
class DeleteNotificationByIdUseCase {
  final NotificationRepo _notificationRepo;

  DeleteNotificationByIdUseCase(this._notificationRepo);

  Future<Result<void>> call(String id) async {
    return await _notificationRepo.deleteNotification(id);
  }
}
