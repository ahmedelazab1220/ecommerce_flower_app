sealed class EmailVerificationState {}

final class EmailVerificationInitial extends EmailVerificationState {}

final class EmailVerificationLoading extends EmailVerificationState {}

final class EmailVerificationSuccess extends EmailVerificationState {}

final class EmailVerificationFailure extends EmailVerificationState {
  final String message;

  EmailVerificationFailure(this.message);
}

final class ResendEmailVerificationLoading extends EmailVerificationState {}

final class ResendEmailVerificationSuccess extends EmailVerificationState {}

final class ResendEmailVerificationFailure extends EmailVerificationState {
  final String message;

  ResendEmailVerificationFailure(this.message);
}
