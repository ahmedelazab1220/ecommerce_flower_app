import 'package:equatable/equatable.dart';

import '../../../../core/base/base_state.dart';

class TrackOrderState extends Equatable {
  final BaseState? baseState;

  const TrackOrderState({this.baseState});

  TrackOrderState copyWith({BaseState? baseState}) {
    return TrackOrderState(baseState: baseState ?? this.baseState);
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class TrackOrderAction {}

class TrackOrderRequestAction extends TrackOrderAction {
  final String orderId;

  TrackOrderRequestAction(this.orderId);
}
