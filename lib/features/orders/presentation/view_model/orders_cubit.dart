import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/orders/domain/entity/order_entity.dart';
import 'package:ecommerce_flower_app/features/orders/domain/usecase/get_orders_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_state.dart';
import 'orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUsecase _getOrdersUsecase;

  final List<OrderEntity> orders = [];
  final List<OrderEntity> ordersInProgress = [];
  final List<OrderEntity> ordersCompleted = [];
  final List<OrderEntity> ordersPending = [];
  final List<OrderEntity> ordersCancelled = [];

  final List<String> tabLabels = [
    'Active',
    'Completed',
    'Pending',
    'Cancelled',
  ];
  final List<String> statuses = [
    'inProgress',
    'completed',
    'pending',
    'cancelled',
  ];

  OrdersCubit(this._getOrdersUsecase)
    : super(OrdersState(baseState: BaseInitialState()));

  void doIntent(OrdersAction action) {
    switch (action) {
      case GetOrdersAction():
        _getOrders();
      case ChangeTabAction():
        _changeTab(action.index);
    }
  }

  Future<void> _getOrders() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getOrdersUsecase();
    switch (result) {
      case SuccessResult<List<OrderEntity>>():
        emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
        orders.addAll(result.data.toList());
        print('Orders: $orders');
        ordersInProgress.addAll(
          result.data.where((order) => order.state == 'inProgress'),
        );
        print('Orders In Progress: $ordersInProgress');
        ordersCompleted.addAll(
          result.data.where((order) => order.state == 'completed'),
        );
        print('Orders Completed: $ordersCompleted');
        ordersPending.addAll(
          result.data.where((order) => order.state == 'pending'),
        );
        print('Orders Pending: $ordersPending');
        ordersCancelled.addAll(
          result.data.where((order) => order.state == 'cancelled'),
        );
        print('Orders Cancelled: $ordersCancelled');
      case FailureResult<List<OrderEntity>>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void _changeTab(int index) {
    emit(state.copyWith(selectedTabIndex: index));
  }
}
