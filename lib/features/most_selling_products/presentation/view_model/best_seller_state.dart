import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class BestSellerState extends Equatable {
  final BaseState? baseState;

  const BestSellerState({this.baseState});

  @override
  List<Object?> get props => [baseState];

  BestSellerState copyWith({BaseState? baseState}) {
    return BestSellerState(baseState: baseState ?? this.baseState);
  }
}

sealed class BestSellerAction {}

class BestSellerRequestAction extends BestSellerAction {}
