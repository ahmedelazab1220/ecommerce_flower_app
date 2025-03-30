import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class EmailVerificationState extends Equatable {
  final BaseState? baseState;
  final BaseState? resendState;

  const EmailVerificationState({this.baseState, this.resendState});

  EmailVerificationState copyWith({
    BaseState? baseState,
    BaseState? resendState,
  }) {
    return EmailVerificationState(
      baseState: baseState ?? this.baseState,
      resendState: resendState ?? this.resendState,
    );
  }

  @override
  List<Object?> get props => [baseState, resendState];
}

sealed class EmailVerificationAction {}

class EmailVerificationRequestAction extends EmailVerificationAction {}

class ResendEmailVerificationRequestAction extends EmailVerificationAction {
  final String email;

  ResendEmailVerificationRequestAction(this.email);
}
