import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/register_request_entity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/use_case/register_use_case.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;
  final Validator validator;

  RegisterCubit(this.registerUseCase, this.validator)
    : super(
        RegisterStates(
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

  void doIntent(RegisterAction intent) {
    switch (intent) {
      case RegisterButtonPressedAction():
        _registerButtonPressed();
        break;
      case GenderChangedAction(:final gender):
        _changeGender(gender);
        break;
      case UserRegistrationAction():
      case NavigateToLoginAction():
        _navigateToLogin();
        break;
    }
  }

  /// Validate form and initiate registration
  void _registerButtonPressed() {
    if (_isRegistering) return; // Prevent duplicate requests
    if (formKey.currentState!.validate()) {
      final request = RegisterRequestEntity(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        gender:
            state.selectedGender == LocaleKeys.Male.tr() ? 'male' : 'female',
        rePassword: confirmPasswordController.text,
      );
      _userRegistration(request);
    }
  }

  void _changeGender(String gender) {
    if (state.selectedGender == gender) return;

    emit(state.copyWith(selectedGender: gender));
  }

  void _navigateToLogin() {
    emit(state.copyWith(registerState: BaseNavigationState(AppRoutes.login)));
  }

  Future<void> _userRegistration(RegisterRequestEntity request) async {
    if (_isRegistering) return;
    _isRegistering = true;

    emit(state.copyWith(registerState: BaseLoadingState()));
    final result = await registerUseCase((request));

    switch (result) {
      case SuccessResult<UserEntity>():
        emit(
          state.copyWith(
            registerState: BaseSuccessState<UserEntity>(data: result.data),
          ),
        );
        _navigateToLogin();
        break;
      case FailureResult<UserEntity>():
        emit(
          state.copyWith(
            registerState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
        break;
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
