import 'package:bloc/bloc.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import '../../domain/entity/notifications_entity.dart';
import '../../domain/usecase/delete_notification_by_id_use_case.dart';
import '../../domain/usecase/get_all_notifications_use_case.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetAllNotificationsUseCase _getNotificationsUseCase;
  final DeleteNotificationByIdUseCase _deleteNotificationUseCase;

  List<NotificationsEntity>? notifications = [];
  NotificationCubit(
    this._getNotificationsUseCase,
    this._deleteNotificationUseCase,
  ) : super(NotificationState(getNotificationsState: BaseInitialState()));

  Future<void> _getNotifications() async {
    emit(state.copyWith(getNotificationsState: BaseLoadingState()));
    final result = await _getNotificationsUseCase();
    switch (result) {
      case SuccessResult<List<NotificationsEntity>>():
        notifications = result.data;
        emit(
          state.copyWith(
            getNotificationsState: BaseSuccessState(data: result.data),
          ),
        );
      case FailureResult<List<NotificationsEntity>>():
        emit(
          state.copyWith(
            getNotificationsState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _deleteNotification(String notificationId) async {
    emit(state.copyWith(deleteNotificationState: BaseLoadingState()));
    final result = await _deleteNotificationUseCase(notificationId);
    switch (result) {
      case SuccessResult<void>():
        notifications?.removeWhere(
          (notification) => notification.id == notificationId,
        );
        emit(state.copyWith(deleteNotificationState: BaseSuccessState()));
      case FailureResult<void>():
        emit(
          state.copyWith(
            deleteNotificationState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> doIntent(NotificationAction action) async {
    switch (action) {
      case GetNotificationsAction():
        _getNotifications();
      case DeleteNotificationAction():
        _deleteNotification(action.notificationId);
    }
  }
}
