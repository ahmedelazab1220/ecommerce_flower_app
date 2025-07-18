import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../../core/utils/validator/validator.dart';
import '../../../data/model/reset_password/reset_password_request_dto.dart';
import 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  final Validator validator;

  ResetPasswordCubit(this._resetPasswordUseCase, this.validator)
    : super(ResetPasswordState(baseState: BaseInitialState()));

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void doIntent(ResetPasswordAction action) {
    switch (action) {
      case ResetPasswordRequestAction():
        _resetPassword(action.email);
        break;
    }
  }

  Future<void> _resetPassword(String email) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _resetPasswordUseCase(
      ResetPasswordRequestDto(
        email: email,
        newPassword: passwordController.text,
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

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
