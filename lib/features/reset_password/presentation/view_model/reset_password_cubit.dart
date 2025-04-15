import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:ecommerce_flower_app/features/reset_password/domain/entities/reset_password_request_entity.dart';
import 'package:ecommerce_flower_app/features/reset_password/domain/use_case/reset_password_use_case.dart';
import 'package:ecommerce_flower_app/features/reset_password/presentation/view_model/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  final Validator validator;
  ResetPasswordCubit(this._resetPasswordUseCase, this.validator)
    : super(const ResetPasswordState());

  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void doIntent(ResetPasswordAction action) {
    switch (action) {
      case ButtonPressedAction():
        _buttonPressd();
        break;
      case FormChangedAction():
        _validateForm();
        break;
    }
  }

  void _validateForm() {
    final isValidNow = formKey.currentState?.validate() ?? false;
    emit(state.copyWith(isFormValid: isValidNow));
  }

  Future<void> _buttonPressd() async {
    final request = ResetPasswordRequestEntity(
      password: currentPasswordController.text,
      newPassword: newPasswordController.text,
    );
    _resetPassword(request);
  }

  Future<void> _resetPassword(ResetPasswordRequestEntity request) async {
    emit(state.copyWith(resetPasswordState: BaseLoadingState()));
    final result = await _resetPasswordUseCase(request);
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(resetPasswordState: BaseSuccessState()));
        break;
      case FailureResult():
        emit(
          state.copyWith(
            resetPasswordState: BaseErrorState(
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
