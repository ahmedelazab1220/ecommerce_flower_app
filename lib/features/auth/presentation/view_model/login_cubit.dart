import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../domain/entity/login_request.dart';
import '../../domain/usecase/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase)
      : super(LoginState(
          baseState: BaseInitialState(),
          isRememberMe: false,
        ));

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isRememberMe = false;

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(
        baseState: BaseLoadingState(),
      ));
      final result = await _loginUseCase.call(LoginRequest(
        email: emailController.text,
        password: passwordController.text,
        isRememberMe: isRememberMe,
      ));
      switch (result) {
        case SuccessResult<void>():
          emit(state.copyWith(
            baseState: BaseSuccessState(),
          ));
        case FailureResult<void>():
          emit(state.copyWith(
            baseState:
                BaseErrorState(errorMessage: result.exception.toString()),
          ));
      }
    }
  }

  void rememberMe(bool value) {
    isRememberMe = value;
    emit(state.copyWith(
      isRememberMe: isRememberMe,
    ));
  }

  void doIntent(LoginAction action) async {
    switch (action) {
      case LoginRequestAction():
        _login();
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.close();
  }
}
