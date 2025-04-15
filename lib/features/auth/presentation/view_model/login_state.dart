part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BaseState? baseState;
  final bool? isRememberMe;

  const LoginState({this.baseState, this.isRememberMe});

  LoginState copyWith({BaseState? baseState, bool? isRememberMe}) {
    return LoginState(
      baseState: baseState ?? this.baseState,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }

  @override
  List<Object?> get props => [baseState, isRememberMe];
}

sealed class LoginAction {}

class LoginRequestAction extends LoginAction {}

class GuestRequestAction extends LoginAction {}
