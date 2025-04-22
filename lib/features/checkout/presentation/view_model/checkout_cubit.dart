import 'package:bloc/bloc.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/request/add_order_request_dto.dart';
import 'package:ecommerce_flower_app/features/checkout/domain/usecase/add_cache_order_use_case.dart';
import 'package:ecommerce_flower_app/features/checkout/domain/usecase/add_credit_order_use_case.dart';
import 'package:ecommerce_flower_app/features/checkout/domain/usecase/get_addresses_use_case.dart';
import 'package:ecommerce_flower_app/features/checkout/domain/usecase/get_cart_info_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../data/model/response/cash_order/add_cache_order_response_dto.dart';
import '../../data/model/response/credit_order/add_credit_order_response_dto.dart';
import '../../domain/entity/addresses_entity.dart';
import '../../domain/entity/cart_entity.dart';
import 'checkout_state.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  final GetAddressesUseCase _getAddressesUseCase;
  final AddCacheOrderUseCase _addCacheOrderUseCase;
  final AddCreditOrderUseCase _addCreditOrderUseCase;
  final GetCartInfoUseCase _getCartInfoUseCase;

  final int currentHours = DateTime.now().hour + 1;
  final int currentMinute = DateTime.now().minute;

  List<AddressesEntity>? addresses = [];
  CartEntity? cartData;

  bool isGift = false;
  int selectedAddressIndex = 0;
  int selectedPaymentIndex = 0;

  CheckoutCubit(
    this._getAddressesUseCase,
    this._addCacheOrderUseCase,
    this._addCreditOrderUseCase,
    this._getCartInfoUseCase,
  ) : super(CheckoutState(baseState: BaseInitialState(), isGift: false));

  Future<void> _getAddresses() async {
    emit(state.copyWith(addressState: BaseLoadingState()));
    final result = await _getAddressesUseCase();
    switch (result) {
      case SuccessResult<List<AddressesEntity>>():
        addresses = result.data;
        emit(state.copyWith(addressState: BaseSuccessState(data: result.data)));
      case FailureResult<List<AddressesEntity>>():
        emit(
          state.copyWith(
            addressState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _getOrderDetails() async {
    emit(state.copyWith(orderDetailsState: BaseLoadingState()));
    final result = await _getCartInfoUseCase();
    switch (result) {
      case SuccessResult<CartEntity>():
        cartData = result.data;
        emit(
          state.copyWith(
            orderDetailsState: BaseSuccessState(data: result.data),
          ),
        );
      case FailureResult<CartEntity>():
        emit(
          state.copyWith(
            orderDetailsState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _addCacheOrder(AddOrderRequestDto request) async {
    emit(state.copyWith(orderState: BaseLoadingState()));
    final result = await _addCacheOrderUseCase(request);
    switch (result) {
      case SuccessResult<AddCacheOrderResponseDto>():
        emit(state.copyWith(orderState: BaseSuccessState(data: result.data)));
      case FailureResult<AddCacheOrderResponseDto>():
        emit(
          state.copyWith(
            orderState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _addCreditOrder(AddOrderRequestDto request) async {
    emit(state.copyWith(orderState: BaseLoadingState()));
    final result = await _addCreditOrderUseCase(request);
    switch (result) {
      case SuccessResult<AddCreditOrderResponseDto>():
        emit(state.copyWith(orderState: BaseSuccessState(data: result.data)));
      case FailureResult<AddCreditOrderResponseDto>():
        emit(
          state.copyWith(
            orderState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void selectAddress(int index) {
    selectedAddressIndex = index;
    emit(state.copyWith(addressState: BaseSuccessState(data: addresses)));
  }

  void selectPayment(int index) {
    selectedPaymentIndex = index;
    if (index == 0) {
      isGift = false;
    }
    emit(
      state.copyWith(
        paymentState: BaseSuccessState(data: index),
        isGift: isGift,
      ),
    );
  }

  void toggleGift(bool value) {
    isGift = value;
    emit(state.copyWith(isGift: isGift));
  }

  void doIntent(CheckoutAction action) {
    switch (action) {
      case GetAddressesAction():
        _getAddresses();
      case AddCacheOrderAction():
        _addCacheOrder(action.request);
      case AddCreditOrderAction():
        throw UnimplementedError();
      case GetOrderDetailsAction():
        _getOrderDetails();
    }
  }
}
