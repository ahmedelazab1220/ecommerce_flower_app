import 'dart:async';

import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/notification_entity.dart';
import '../../domain/usecase/delete_notification_by_id_use_case.dart';
import '../../domain/usecase/get_all_notifications_use_case.dart';
import 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final GetAllNotificationsUseCase _getNotificationsUseCase;
  final DeleteNotificationByIdUseCase _deleteNotificationUseCase;

  List<NotificationEntity>? notifications = [];
  Timer? _timer;
  String? deletingNotificationId;
  final Map<String, int> _counters = {};
  final Map<String, Timer> _timers = {};
  final Map<String, bool> _isCountingDown = {};
  final ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> isCountingDownNotifier = ValueNotifier<bool>(false);

  NotificationCubit(
    this._getNotificationsUseCase,
    this._deleteNotificationUseCase,
  ) : super(NotificationState(getNotificationsState: BaseInitialState()));

  Future<void> _getNotifications() async {
    emit(state.copyWith(getNotificationsState: BaseLoadingState()));
    final result = await _getNotificationsUseCase();
    switch (result) {
      case SuccessResult<List<NotificationEntity>>():
        notifications = result.data;
        emit(
          state.copyWith(
            getNotificationsState: BaseSuccessState(data: result.data),
          ),
        );
      case FailureResult<List<NotificationEntity>>():
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

  void _cuttingProcessNotificationManager(String notificationId) {
    _counters.putIfAbsent(notificationId, () => 5);
    _isCountingDown.putIfAbsent(notificationId, () => false);

    if (_isCountingDown[notificationId]!) {
      _timers[notificationId]?.cancel();
      _counters[notificationId] = 5;
      _isCountingDown[notificationId] = false;
    } else {
      _counters[notificationId] = 5;
      _isCountingDown[notificationId] = true;

      _timers[notificationId] = Timer.periodic(const Duration(seconds: 1), (
        timer,
      ) {
        _counters[notificationId] = _counters[notificationId]! - 1;

        if (_counters[notificationId] == 0) {
          timer.cancel();
          doIntent(DeleteNotificationAction(notificationId));
          _isCountingDown[notificationId] = false;
          // Clean up
          _counters.remove(notificationId);
          _timers.remove(notificationId);
          _isCountingDown.remove(notificationId);
        }
        counterNotifier.value = counterNotifier.value + 1;
      });
    }
    counterNotifier.value = counterNotifier.value + 1;
  }

  int getCounter(String notificationId) => _counters[notificationId] ?? 0;
  bool isCountingDown(String notificationId) =>
      _isCountingDown[notificationId] ?? false;

  Future<void> doIntent(NotificationAction action) async {
    switch (action) {
      case GetNotificationsAction():
        {
          _getNotifications();
        }
      case DeleteNotificationAction():
        {
          _deleteNotification(action.notificationId);
        }
      case CuttingProcessNotificationManager():
        {
          _cuttingProcessNotificationManager(action.notificationId);
        }
    }
  }
}
