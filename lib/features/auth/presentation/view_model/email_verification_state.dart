import 'package:ecommerce_flower_app/core/base/base_state.dart';

class EmailVerificationState {
  final BaseState? baseState;
  final BaseState? resendState;

  EmailVerificationState({this.baseState, this.resendState});

  EmailVerificationState copyWith({
    BaseState? baseState,
    BaseState? resendState,
  }) {
    return EmailVerificationState(
      baseState: baseState ?? this.baseState,
      resendState: resendState ?? this.resendState,
    );
  }
}

sealed class EmailVerificationAction {}

class EmailVerificationRequestAction extends EmailVerificationAction {}

class ResendEmailVerificationRequestAction extends EmailVerificationAction {
  final String email;

  ResendEmailVerificationRequestAction(this.email);
}
