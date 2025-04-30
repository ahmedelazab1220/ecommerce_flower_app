import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/notification_entity.dart';
import '../repo/notification_repo.dart';

@injectable
class GetNotificationByIdUseCase {
  final NotificationRepo _notificationRepo;

  GetNotificationByIdUseCase(this._notificationRepo);

  Future<Result<NotificationEntity>> call(String id) async {
    return await _notificationRepo.getNotificationById(id);
  }
}
