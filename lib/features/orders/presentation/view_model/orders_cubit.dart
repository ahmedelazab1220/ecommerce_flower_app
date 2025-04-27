import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/shared_features/add_to_cart/domain/usecase/add_to_cart_use_case.dart';
import 'package:ecommerce_flower_app/features/orders/domain/entity/order_entity.dart';
import 'package:ecommerce_flower_app/features/orders/domain/usecase/get_orders_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/shared_features/add_to_cart/data/model/request/add_to_cart_request_dto.dart';
import '../../../../core/utils/shared_features/add_to_cart/data/model/response/add_to_cart_response_dto.dart';
import 'orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUsecase _getOrdersUsecase;
  final AddToCartUseCase _addToCartUseCase;

  final List<OrderEntity> orders = [];
  final List<OrderEntity> ordersInProgress = [];
  final List<OrderEntity> ordersCompleted = [];
  final List<OrderEntity> ordersPending = [];
  final List<OrderEntity> ordersCancelled = [];

  final List<String> tabLabels = [
    LocaleKeys.Active.tr(),
    LocaleKeys.Completed.tr(),
    LocaleKeys.Pending.tr(),
    LocaleKeys.Cancelled.tr(),
  ];
  final List<String> statuses = [
    'inProgress',
    'completed',
    'pending',
    'cancelled',
  ];

  List<OrderEntity> get currentOrders {
    switch (state.selectedTabIndex) {
      case 0:
        return ordersInProgress;
      case 1:
        return ordersCompleted;
      case 2:
        return ordersPending;
      case 3:
        return ordersCancelled;
      default:
        return [];
    }
  }

  List<MapEntry<OrderEntity, OrderItemEntity>> get flattenedOrderItems {
    return currentOrders
        .expand(
          (order) => order.orderItems.map((item) => MapEntry(order, item)),
        )
        .toList();
  }

  OrdersCubit(this._getOrdersUsecase, this._addToCartUseCase)
    : super(OrdersState(baseState: BaseInitialState()));

  void doIntent(OrdersAction action) {
    switch (action) {
      case GetOrdersAction():
        _getOrders();
      case AddToCartAction():
        _addToCart(action.productId);
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
        orders.addAll(result.data);
        ordersInProgress.addAll(
          result.data.where((order) => order.state == 'inProgress'),
        );
        ordersCompleted.addAll(
          result.data.where((order) => order.state == 'completed'),
        );
        ordersPending.addAll(
          result.data.where((order) => order.state == 'pending'),
        );
        ordersCancelled.addAll(
          result.data.where((order) => order.state == 'cancelled'),
        );
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

  Future<void> _addToCart(String productId) async {
    emit(state.copyWith(cartState: BaseLoadingState()));
    final result = await _addToCartUseCase(
      AddToCartRequestDto(product: productId, quantity: 1),
    );
    switch (result) {
      case SuccessResult<AddToCartResponseDto>():
        emit(state.copyWith(cartState: BaseSuccessState(data: result.data)));
      case FailureResult<AddToCartResponseDto>():
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
