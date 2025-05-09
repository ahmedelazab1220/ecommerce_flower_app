import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class EmailVerificationState extends Equatable {
  final BaseState? baseState;
  final BaseState? resendState;
  final bool canResend;
  final int countdown;

  const EmailVerificationState({
    this.baseState,
    this.resendState,
    this.canResend = true,
    this.countdown = 0,
  });

  EmailVerificationState copyWith({
    BaseState? baseState,
    BaseState? resendState,
    bool? canResend,
    int? countdown,
  }) {
    return EmailVerificationState(
      baseState: baseState ?? this.baseState,
      resendState: resendState ?? this.resendState,
      canResend: canResend ?? this.canResend,
      countdown: countdown ?? this.countdown,
    );
  }

  @override
  List<Object?> get props => [baseState, resendState, canResend, countdown];
}

sealed class EmailVerificationAction {}

final class EmailVerificationRequestAction extends EmailVerificationAction {}

final class ResendEmailVerificationRequestAction
    extends EmailVerificationAction {
  final String email;

  ResendEmailVerificationRequestAction(this.email);
}
