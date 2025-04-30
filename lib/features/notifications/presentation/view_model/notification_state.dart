import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  final BaseState? getNotificationsState;
  final BaseState? deleteNotificationState;
  final int countdownSeconds;

  const NotificationState({
    this.getNotificationsState,
    this.deleteNotificationState,
    this.countdownSeconds = 0,
  });

  @override
  List<Object?> get props => [
    getNotificationsState,
    deleteNotificationState,
    countdownSeconds,
  ];

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
      countdownSeconds: countdownSeconds ?? this.countdownSeconds,
    );
  }
}

sealed class NotificationAction {}

class GetNotificationsAction extends NotificationAction {}

class DeleteNotificationAction extends NotificationAction {
  final String notificationId;

  DeleteNotificationAction(this.notificationId);
}
