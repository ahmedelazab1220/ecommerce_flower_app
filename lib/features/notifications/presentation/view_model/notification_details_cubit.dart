import 'package:bloc/bloc.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../domain/entity/notifications_entity.dart';
import '../../domain/usecase/get_notification_by_id_use_case.dart';
import 'notification_details_state.dart';

class NotificationDetailsCubit extends Cubit<NotificationDetailsState> {
  final GetNotificationByIdUseCase _getNotificationByIdUseCase;

  NotificationsEntity? notification;
  NotificationDetailsCubit(this._getNotificationByIdUseCase)
    : super(
        NotificationDetailsState(getNotificationByIdState: BaseInitialState()),
      );

  Future<void> getNotificationById(String notificationId) async {
    emit(state.copyWith(getNotificationByIdState: BaseLoadingState()));
    final result = await _getNotificationByIdUseCase(notificationId);
    switch (result) {
      case SuccessResult<NotificationsEntity>():
        emit(
          state.copyWith(
            getNotificationByIdState: BaseSuccessState(data: result.data),
          ),
        );
      case FailureResult<NotificationsEntity>():
        emit(
          state.copyWith(
            getNotificationByIdState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }
}
