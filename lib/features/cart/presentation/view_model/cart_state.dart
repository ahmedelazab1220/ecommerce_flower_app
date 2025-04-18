import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final BaseState? baseState;
  final BaseState? guestState;

  const CartState({this.baseState, this.guestState});

  @override
  List<Object?> get props => [baseState, guestState];

  CartState copyWith({BaseState? baseState, BaseState? guestState}) {
    return CartState(
      baseState: baseState ?? this.baseState,
      guestState: guestState ?? this.guestState,
    );
  }
}

sealed class CartAction {}

class GetCartAction extends CartAction {}

class AddProductToCartAction extends CartAction {
  final String productId;

  AddProductToCartAction(this.productId);
}

class UpdateProductInCartAction extends CartAction {
  final String productId;
  final int quantity;

  UpdateProductInCartAction(this.productId, this.quantity);
}

class DeleteProductFromCartAction extends CartAction {
  final String productId;

  DeleteProductFromCartAction(this.productId);
}

class ClearCartAction extends CartAction {}

class GuestStateRequestAction extends CartAction {}
