import 'package:equatable/equatable.dart';

import '../../../../core/base/base_state.dart';
import '../../data/model/request/add_order_request_dto.dart';

class CheckoutState extends Equatable {
  final BaseState? baseState;
  final BaseState? addressState;
  final BaseState? orderState;
  final BaseState? paymentState;
  final BaseState? orderDetailsState;

  const CheckoutState({
    this.baseState,
    this.addressState,
    this.orderState,
    this.paymentState,
    this.orderDetailsState,
  });

  @override
  List<Object?> get props => [
    baseState,
    addressState,
    orderState,
    paymentState,
    orderDetailsState,
  ];

  CheckoutState copyWith({
    BaseState? baseState,
    BaseState? addressState,
    BaseState? orderState,
    BaseState? paymentState,
    BaseState? orderDetailsState,
  }) {
    return CheckoutState(
      baseState: baseState ?? this.baseState,
      addressState: addressState ?? this.addressState,
      orderState: orderState ?? this.orderState,
      paymentState: paymentState ?? this.paymentState,
      orderDetailsState: orderDetailsState ?? this.orderDetailsState,
    );
  }
}

sealed class CheckoutAction {}

class GetAddressesAction extends CheckoutAction {}

class AddCacheOrderAction extends CheckoutAction {
  final AddOrderRequestDto request;

  AddCacheOrderAction(this.request);
}

class AddCreditOrderAction extends CheckoutAction {
  final AddOrderRequestDto request;

  AddCreditOrderAction(this.request);
}

class AddPaymentAction extends CheckoutAction {}

class GetOrderDetailsAction extends CheckoutAction {}
