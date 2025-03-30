import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordState extends Equatable {
  final BaseState? baseState;

  const ForgetPasswordState({this.baseState});

  ForgetPasswordState copyWith({BaseState? baseState}) {
    return ForgetPasswordState(baseState: baseState ?? this.baseState);
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class ForgetPasswordAction {}

class ForgetPasswordRequestAction extends ForgetPasswordAction {}
