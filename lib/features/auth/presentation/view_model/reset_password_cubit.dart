import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../data/model/reset_password/reset_password_request_dto.dart';
import 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase _resetPasswordUsecase;
  final Validator validator;

  ResetPasswordCubit(this._resetPasswordUsecase, this.validator)
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
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(baseState: BaseLoadingState()));
      final result = await _resetPasswordUsecase(
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
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
