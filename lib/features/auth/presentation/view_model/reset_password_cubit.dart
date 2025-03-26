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
  final Validator validator = Validator();

  ResetPasswordCubit(this._resetPasswordUsecase)
    : super(ResetPasswordInitial());

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> resetPassword(String email) async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordLoading());
      final result = await _resetPasswordUsecase(
        ResetPasswordRequestDto(
          email: email,
          newPassword: passwordController.text,
        ),
      );
      switch (result) {
        case SuccessResult<void>():
          emit(ResetPasswordSuccess());
        case FailureResult<void>():
          emit(ResetPasswordFailure(result.exception.toString()));
      }
    }
  }
}
