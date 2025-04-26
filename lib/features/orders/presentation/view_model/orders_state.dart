import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class OrdersState extends Equatable {
  final BaseState? baseState;
  final int selectedTabIndex;

  const OrdersState({this.baseState, this.selectedTabIndex = 0});

  OrdersState copyWith({BaseState? baseState, int? selectedTabIndex}) {
    return OrdersState(
      baseState: baseState ?? this.baseState,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object?> get props => [baseState, selectedTabIndex];
}

sealed class OrdersAction {}

class GetOrdersAction extends OrdersAction {}

class ChangeTabAction extends OrdersAction {
  final int index;

  ChangeTabAction(this.index);
}
