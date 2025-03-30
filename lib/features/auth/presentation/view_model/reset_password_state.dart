import '../../../../core/base/base_state.dart';

class ResetPasswordState {
  final BaseState? baseState;

  ResetPasswordState({this.baseState});

  ResetPasswordState copyWith({BaseState? baseState}) {
    return ResetPasswordState(baseState: baseState ?? this.baseState);
  }
}

sealed class ResetPasswordAction {}

class ResetPasswordRequestAction extends ResetPasswordAction {
  final String email;

  ResetPasswordRequestAction(this.email);
}
