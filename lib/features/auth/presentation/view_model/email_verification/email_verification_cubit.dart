import 'dart:async';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_flower_app/features/auth/domain/use_case/verify_reset_code_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/forget_password/forget_password_request_dto.dart';
import 'email_verification_state.dart';

@injectable
class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final Validator validator;

  EmailVerificationCubit(
    this._verifyResetCodeUseCase,
    this._forgetPasswordUseCase,
    this.validator,
  ) : super(EmailVerificationState(baseState: BaseInitialState()));

  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void doIntent(EmailVerificationAction action) {
    switch (action) {
      case EmailVerificationRequestAction():
        _verifyResetCode();
        break;
      case ResendEmailVerificationRequestAction():
        _resendEmailVerification(action.email);
        break;
    }
  }

  Future<void> _verifyResetCode() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _verifyResetCodeUseCase(
      VerifyResetCodeRequestDto(resetCode: pinController.text),
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

  Future<void> _resendEmailVerification(String email) async {
    emit(
      state.copyWith(
        baseState: BaseInitialState(),
        resendState: BaseLoadingState(),
      ),
    );
    pinController.clear();
    final result = await _forgetPasswordUseCase(
      ForgetPasswordRequestDto(email: email),
    );
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(resendState: BaseSuccessState()));
      case FailureResult<void>():
        emit(
          state.copyWith(
            resendState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  @override
  Future<void> close() {
    pinController.dispose();
    return super.close();
  }
}
