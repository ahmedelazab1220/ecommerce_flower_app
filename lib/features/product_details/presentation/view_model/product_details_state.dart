import 'package:equatable/equatable.dart';

import '../../../../core/base/base_state.dart';

class ProductDetailsState extends Equatable {
  final BaseState? baseState;

  const ProductDetailsState({this.baseState});

  @override
  List<Object?> get props => [baseState];

  ProductDetailsState copyWith({BaseState? baseState}) {
    return ProductDetailsState(baseState: baseState ?? this.baseState);
  }
}

sealed class ProductDetailsAction {}

class AddProductToCartAction extends ProductDetailsAction {
  final String productId;

  AddProductToCartAction(this.productId);
}
