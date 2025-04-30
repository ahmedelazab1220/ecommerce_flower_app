import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class OrdersState extends Equatable {
  final BaseState? baseState;
  final BaseState? cartState;
  final int selectedTabIndex;

  const OrdersState({
    this.baseState,
    this.cartState,
    this.selectedTabIndex = 0,
  });

  OrdersState copyWith({
    BaseState? baseState,
    BaseState? cartState,
    int? selectedTabIndex,
  }) {
    return OrdersState(
      baseState: baseState ?? this.baseState,
      cartState: cartState ?? this.cartState,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object?> get props => [baseState, cartState, selectedTabIndex];
}

sealed class OrdersAction {}

class GetOrdersAction extends OrdersAction {}

class AddToCartAction extends OrdersAction {
  final String productId;

  AddToCartAction(this.productId);
}

class ChangeTabAction extends OrdersAction {
  final int index;

  ChangeTabAction(this.index);
}
