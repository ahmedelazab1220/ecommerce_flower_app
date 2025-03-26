import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_request_dto/register_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/use_case/register_use_case.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase)
    : super(RegisterStates(registerState: BaseInitialState()));

  /// Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  /// Validator
  final Validator validator = getIt<Validator>();

  /// Gender Selection
  String selectedGender = LocaleKeys.Female.tr();

  /// Prevent multiple requests
  bool _isRegistering = false;

  /// Validate form and initiate registration
  void registerButtonPressed() {
    if (_isRegistering) return; // Prevent duplicate requests
    if (formKey.currentState!.validate()) {
      final request = RegisterRequestDto(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        gender: selectedGender,
        rePassword: confirmPasswordController.text,
      );
      register(request);
    }
  }

  /// Change gender selection
  void changeGender(String gender) {
    selectedGender = gender;
    emit(RegisterStates(registerState: BaseInitialState()));
  }

  /// Reset state and navigate to login
  void navigateToLogin() {
    emit(state.copyWith(registerState: BaseInitialState()));
  }

  Future<void> register(RegisterRequestDto request) async {
    if (_isRegistering) return;
    _isRegistering = true;

    emit(state.copyWith(registerState: BaseLoadingState()));
    final result = await registerUseCase((request));

    if (result is SuccessResult<UserEntity>) {
      emit(
        state.copyWith(
          registerState: BaseSuccessState<UserEntity>(data: result.data),
        ),
      );
    } else if (result is FailureResult<UserEntity>) {
      emit(
        state.copyWith(
          registerState: BaseErrorState(
            errorMessage: result.exception.toString(),
          ),
        ),
      );
    }

    _isRegistering = false;
  }

  /// dispose controllers
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
