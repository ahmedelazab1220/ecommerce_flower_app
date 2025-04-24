import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/change_password_request_entity.dart';
import '../../domain/use_case/change_password_use_case.dart';
import 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  final Validator validator;

  ChangePasswordCubit(this._changePasswordUseCase, this.validator)
    : super(const ChangePasswordState());

  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void doIntent(ChangePasswordAction action) {
    switch (action) {
      case ButtonPressedAction():
        {
          _buttonPressd();
        }
      case FormChangedAction():
        {
          _validateForm();
        }
    }
  }

  void _validateForm() {
    final isValidNow = formKey.currentState?.validate() ?? false;
    emit(state.copyWith(isFormValid: isValidNow));
  }

  Future<void> _buttonPressd() async {
    final request = ChangePasswordRequestEntity(
      password: currentPasswordController.text,
      newPassword: newPasswordController.text,
    );
    _changePassword(request);
  }

  Future<void> _changePassword(ChangePasswordRequestEntity request) async {
    emit(state.copyWith(changePasswordState: BaseLoadingState()));
    final result = await _changePasswordUseCase(request);
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(changePasswordState: BaseSuccessState()));
        break;
      case FailureResult():
        emit(
          state.copyWith(
            changePasswordState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
        break;
    }
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
