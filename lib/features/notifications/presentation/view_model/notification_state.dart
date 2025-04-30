import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  final BaseState? getNotificationsState;
  final BaseState? deleteNotificationState;

  const NotificationState({
    this.getNotificationsState,
    this.deleteNotificationState,
  });

  NotificationState copyWith({
    BaseState? getNotificationsState,
    BaseState? deleteNotificationState,
    int? countdownSeconds,
  }) {
    return NotificationState(
      getNotificationsState:
          getNotificationsState ?? this.getNotificationsState,
      deleteNotificationState:
          deleteNotificationState ?? this.deleteNotificationState,
    );
  }

  @override
  List<Object?> get props => [getNotificationsState, deleteNotificationState];
}

sealed class NotificationAction {}

final class GetNotificationsAction extends NotificationAction {}

final class DeleteNotificationAction extends NotificationAction {
  final String notificationId;

  DeleteNotificationAction(this.notificationId);
}

final class CuttingProcessNotificationManager extends NotificationAction {
  final String notificationId;

  CuttingProcessNotificationManager(this.notificationId);
}
