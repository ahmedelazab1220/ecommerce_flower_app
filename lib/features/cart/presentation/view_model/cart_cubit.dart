import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/shared_features/is_guest/domain/usecase/is_guest_use_case.dart';
import 'package:ecommerce_flower_app/features/cart/data/model/add_product_to_cart_request_dto.dart';
import 'package:ecommerce_flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/update_product_quantity_request_dto.dart';
import '../../domain/usecase/add_product_to_cart_usecase.dart';
import '../../domain/usecase/clear_cart_usecase.dart';
import '../../domain/usecase/delete_product_from_cart_usecase.dart';
import '../../domain/usecase/get_cart_usecase.dart';
import '../../domain/usecase/update_product_in_cart_usecase.dart';
import 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCartUsecase _getCartUsecase;
  final ClearCartUsecase _clearCartUsecase;
  final AddProductToCartUsecase _addProductToCartUsecase;
  final UpdateProductInCartUsecase _updateProductInCartUsecase;
  final DeleteProductFromCartUsecase _deleteProductFromCartUsecase;
  final IsGuestUseCase _guestModeUseCase;

  String? token;

  CartCubit(
    this._getCartUsecase,
    this._clearCartUsecase,
    this._addProductToCartUsecase,
    this._updateProductInCartUsecase,
    this._deleteProductFromCartUsecase,
    this._guestModeUseCase,
  ) : super(CartState(baseState: BaseInitialState()));

  void doIntent(CartAction action) {
    switch (action) {
      case GetCartAction():
        _getCart();
      case AddProductToCartAction():
        _addProductToCart(action.productId);
      case UpdateProductInCartAction():
        _updateProductInCart(action.productId, action.quantity);
      case DeleteProductFromCartAction():
        _deleteProductFromCart(action.productId);
      case ClearCartAction():
        _clearCart();
      case GuestStateRequestAction():
        _isGuestUser();
    }
  }

  Future<void> _isGuestUser() async {
    emit(state.copyWith(guestState: BaseLoadingState()));
    token = await _guestModeUseCase.call();
    if (token == null || token!.isEmpty) {
      emit(state.copyWith(guestState: BaseSuccessState()));
    } else {
      emit(
        state.copyWith(
          guestState: BaseErrorState(errorMessage: "You are not a guest user"),
        ),
      );
    }
  }

  Future<void> _getCart() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getCartUsecase();
    switch (result) {
      case SuccessResult<CartEntity>():
        emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
      case FailureResult<CartEntity>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _addProductToCart(String productId) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _addProductToCartUsecase(
      AddProductToCartRequestDto(product: productId),
    );
    switch (result) {
      case SuccessResult<CartEntity>():
        emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
      case FailureResult<CartEntity>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _updateProductInCart(String productId, int quantity) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _updateProductInCartUsecase(
      productId,
      UpdateProductQuantityRequestDto(quantity: quantity),
    );
    switch (result) {
      case SuccessResult<CartEntity>():
        emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
      case FailureResult<CartEntity>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _deleteProductFromCart(String productId) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _deleteProductFromCartUsecase(productId);
    switch (result) {
      case SuccessResult<CartEntity>():
        emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
      case FailureResult<CartEntity>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _clearCart() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _clearCartUsecase();
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(baseState: BaseSuccessState()));
      case FailureResult<void>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }
}
