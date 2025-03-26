import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../domain/usecase/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  final Validator _validator = Validator();

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isRememberMe = false;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      final result = await _loginUseCase.call(
          emailController.text, passwordController.text);
      switch (result) {
        case SuccessResult<void>():
          emit(LoginSuccess());
        case FailureResult<void>():
          emit(LoginFailure(result.exception.toString()));
      }
    }
  }

  String? validateEmail(String value) {
    return _validator.validateEmail(value);
  }

  String? validatePassword(String value) {
    return _validator.validatePassword(value);
  }

  void rememberMe(bool value) {
    isRememberMe = value;
    emit(LoginRememberMe(isRememberMe));
  }
}
