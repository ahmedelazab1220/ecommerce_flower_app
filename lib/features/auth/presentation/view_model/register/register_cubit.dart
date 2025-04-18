import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/register_entity/register_request_entity.dart';
import '../../../domain/entity/user_enttity.dart';
import '../../../domain/use_case/register_use_case.dart';
import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  final Validator validator;

  RegisterCubit(this._registerUseCase, this.validator)
    : super(
        RegisterState(
          registerState: BaseInitialState(),
          selectedGender: LocaleKeys.Female.tr(),
        ),
      );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  /// Prevent multiple requests
  bool _isRegistering = false;

  void doIntent(RegisterAction action) {
    switch (action) {
      case GenderChangedAction():
        {
          _changeGender(action.gender);
        }

      case UserRegistrationAction():
        {
          _registerButtonPressed();
        }
      case NavigationAction():
        {
          _navigationToScreen(routeName: action.routeName, type: action.type);
        }
    }
  }

  void _registerButtonPressed() {
    if (_isRegistering) return;
    if (formKey.currentState!.validate()) {
      final request = RegisterRequestEntity(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        gender: state.selectedGender.toLowerCase(),
        rePassword: confirmPasswordController.text,
      );
      _userRegistration(request);
    }
  }

  void _changeGender(String gender) {
    if (state.selectedGender == gender) return;

    emit(state.copyWith(selectedGender: gender));
  }

  void _navigationToScreen({
    required String routeName,
    required NavigationType type,
  }) {
    emit(
      state.copyWith(
        registerState: BaseNavigationState(
          routeName: AppRoutes.loginRoute,
          type: type,
        ),
      ),
    );
  }

  Future<void> _userRegistration(RegisterRequestEntity request) async {
    if (_isRegistering) return;
    _isRegistering = true;

    emit(state.copyWith(registerState: BaseLoadingState()));
    final result = await _registerUseCase((request));

    switch (result) {
      case SuccessResult<UserEntity>():
        {
          emit(
            state.copyWith(
              registerState: BaseSuccessState<UserEntity>(data: result.data),
            ),
          );
        }
      case FailureResult<UserEntity>():
        {
          emit(
            state.copyWith(
              registerState: BaseErrorState(
                errorMessage: result.exception.toString(),
              ),
            ),
          );
        }
    }

    _isRegistering = false;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
