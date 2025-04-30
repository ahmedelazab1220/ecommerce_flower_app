import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/notifications_entity.dart';
import '../../domain/usecase/delete_notification_by_id_use_case.dart';
import '../../domain/usecase/get_all_notifications_use_case.dart';
import 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final GetAllNotificationsUseCase _getNotificationsUseCase;
  final DeleteNotificationByIdUseCase _deleteNotificationUseCase;

  List<NotificationsEntity>? notifications = [];
  Timer? _timer;
  int countdown = 0;
  String? deletingNotificationId;

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
        notifications?.removeWhere((n) => n.id == notificationId);
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

  void startDeleteCountdown(String notificationId) {
    deletingNotificationId = notificationId;
    countdown = 5;
    emit(state.copyWith(countdownSeconds: countdown));

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countdown--;
      if (countdown <= 0) {
        timer.cancel();
        _confirmDelete();
      } else {
        emit(state.copyWith(countdownSeconds: countdown));
      }
    });
  }

  void cancelDeleteCountdown() {
    _timer?.cancel();
    deletingNotificationId = null;
    emit(state.copyWith(countdownSeconds: 0));
  }

  Future<void> _confirmDelete() async {
    final id = deletingNotificationId;
    deletingNotificationId = null;
    emit(state.copyWith(countdownSeconds: 0));
    if (id != null) {
      await _deleteNotification(id);
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
