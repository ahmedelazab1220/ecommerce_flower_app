import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final BaseState? baseState;

  const CartState({this.baseState});

  @override
  List<Object?> get props => [baseState];

  CartState copyWith({BaseState? baseState}) {
    return CartState(baseState: baseState ?? this.baseState);
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
