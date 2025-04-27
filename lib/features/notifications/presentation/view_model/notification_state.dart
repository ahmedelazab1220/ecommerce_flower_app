import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  final BaseState? getNotificationsState;
  final BaseState? deleteNotificationState;

  const NotificationState({
    this.getNotificationsState,
    this.deleteNotificationState,
  });

  @override
  List<Object?> get props => [getNotificationsState, deleteNotificationState];

  NotificationState copyWith({
    BaseState? getNotificationsState,
    BaseState? deleteNotificationState,
  }) {
    return NotificationState(
      getNotificationsState:
          getNotificationsState ?? this.getNotificationsState,
      deleteNotificationState:
          deleteNotificationState ?? this.deleteNotificationState,
    );
  }
}

sealed class NotificationAction {}

class GetNotificationsAction extends NotificationAction {}

class DeleteNotificationAction extends NotificationAction {
  final String notificationId;

  DeleteNotificationAction(this.notificationId);
}
