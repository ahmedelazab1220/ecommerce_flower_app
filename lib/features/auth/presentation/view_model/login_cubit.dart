import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../domain/entity/login_request.dart';
import '../../domain/usecase/guest_use_case.dart';
import '../../domain/usecase/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final GuestUseCase _guestUseCase;
  final Validator validator;

  LoginCubit(this._loginUseCase, this._guestUseCase, this.validator)
    : super(LoginState(baseState: BaseInitialState(), isRememberMe: false));

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isRememberMe = false;

  void doIntent(LoginAction action) async {
    switch (action) {
      case LoginRequestAction():
        _login();
      case GuestRequestAction():
        _guestLogin();
      case NavigationAction():
        _naviagtionToScreen(
          routeName: action.routeName,
          replace: action.replace,
        );
    }
  }

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(baseState: BaseLoadingState()));
      final result = await _loginUseCase.call(
        LoginRequest(
          email: emailController.text,
          password: passwordController.text,
          isRememberMe: isRememberMe,
        ),
      );
      switch (result) {
        case SuccessResult<void>():
          emit(state.copyWith(baseState: BaseSuccessState()));
        case FailureResult<void>():
          emit(
            state.copyWith(
              baseState: BaseErrorState(
                errorMessage: result.exception.toString(),
              ),
            ),
          );
      }
    }
  }

  Future<void> _guestLogin() async {
    await _guestUseCase.call();
    doIntent(
      NavigationAction(routeName: AppRoutes.mainLayoutRoute, replace: true),
    );
  }

  void rememberMe(bool value) {
    isRememberMe = value;
    emit(state.copyWith(isRememberMe: isRememberMe));
  }

  void _naviagtionToScreen({required String routeName, bool replace = false}) {
    emit(
      state.copyWith(
        baseState: BaseNavigationState(routeName: routeName, replace: replace),
      ),
    );
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.close();
  }
}
