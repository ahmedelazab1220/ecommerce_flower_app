part of 'login_cubit.dart';

// @immutable
// sealed class LoginState {}
//
// final class LoginInitial extends LoginState {}
//
// final class LoginLoading extends LoginState {}
//
// final class LoginSuccess extends LoginState {}
//
// final class LoginFailure extends LoginState {
//   final String message;
//
//   LoginFailure(this.message);
// }
//
// final class LoginRememberMe extends LoginState {
//   final bool isRememberMe;
//
//   LoginRememberMe(this.isRememberMe);
// }

class LoginState extends Equatable {
  final BaseState? baseState;
  final bool? isRememberMe;

  const LoginState({this.baseState, this.isRememberMe});

  LoginState copyWith({
    BaseState? baseState,
    bool? isRememberMe,
  }) {
    return LoginState(
      baseState: baseState ?? this.baseState,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }

  @override
  List<Object?> get props => [
        baseState,
        isRememberMe,
      ];
}

sealed class LoginAction {}

class LoginRequestAction extends LoginAction {}

class GuestRequestAction extends LoginAction {}
