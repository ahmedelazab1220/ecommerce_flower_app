import 'package:ecommerce_flower_app/core/base/base_state.dart';

class ForgetPasswordState {
  final BaseState? baseState;

  ForgetPasswordState({this.baseState});

  ForgetPasswordState copyWith({BaseState? baseState}) {
    return ForgetPasswordState(baseState: baseState ?? this.baseState);
  }
}

sealed class ForgetPasswordAction {}

class ForgetPasswordRequestAction extends ForgetPasswordAction {}
