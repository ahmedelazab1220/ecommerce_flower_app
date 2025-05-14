import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../data/model/track_order_request_dto.dart';
import '../../domain/usecase/track_order_use_case.dart';
import 'track_order_state.dart';

@injectable
class TrackOrderCubit extends Cubit<TrackOrderState> {
  final TrackOrderUseCase _trackOrderUseCase;

  int currentState = 1;

  TrackOrderCubit(this._trackOrderUseCase)
    : super(TrackOrderState(baseState: BaseInitialState()));

  void _trackOrder(String orderId) {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final request = TrackOrderRequestDto(orderId: orderId);
    _trackOrderUseCase.trackOrder(request).listen((result) {
      switch (result) {
        case SuccessResult():
          currentState = result.data.status;
          emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
          break;
        case FailureResult():
          emit(
            state.copyWith(
              baseState: BaseErrorState(
                errorMessage: result.exception.toString(),
              ),
            ),
          );
      }
    });
  }

  void doIntent(TrackOrderAction action) {
    switch (action) {
      case TrackOrderRequestAction():
        _trackOrder(action.orderId);
    }
  }
}
