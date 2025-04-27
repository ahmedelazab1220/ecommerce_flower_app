import 'package:equatable/equatable.dart';

import '../../../../core/base/base_state.dart';

class NotificationDetailsState extends Equatable {
  final BaseState? getNotificationByIdState;

  const NotificationDetailsState({this.getNotificationByIdState});

  @override
  List<Object?> get props => [getNotificationByIdState];

  NotificationDetailsState copyWith({BaseState? getNotificationByIdState}) {
    return NotificationDetailsState(
      getNotificationByIdState:
          getNotificationByIdState ?? this.getNotificationByIdState,
    );
  }
}

sealed class NotificationDetailsAction {}

class GetNotificationByIdAction extends NotificationDetailsAction {
  final String notificationId;

  GetNotificationByIdAction(this.notificationId);
}
