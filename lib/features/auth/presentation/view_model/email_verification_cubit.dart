import 'dart:async';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:ecommerce_flower_app/features/auth/domain/usecase/verify_reset_code_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/forget_password/forget_password_request_dto.dart';
import 'email_verification_state.dart';

@injectable
class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final VerifyResetCodeUsecase verifyResetCodeUsecase;
  final ForgetPasswordUsecase forgetPasswordUsecase;
  final Validator validator = Validator();

  EmailVerificationCubit(
    this.verifyResetCodeUsecase,
    this.forgetPasswordUsecase,
  ) : super(EmailVerificationInitial());

  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> verifyResetCode() async {
    emit(EmailVerificationLoading());
    final result = await verifyResetCodeUsecase(
      VerifyResetCodeRequestDto(resetCode: pinController.text),
    );
    switch (result) {
      case SuccessResult<void>():
        emit(EmailVerificationSuccess());
      case FailureResult<void>():
        emit(EmailVerificationFailure(result.exception.toString()));
    }
  }

  Future<void> resendEmailVerification(String email) async {
    emit(ResendEmailVerificationLoading());
    final result = await forgetPasswordUsecase(
      ForgetPasswordRequestDto(email: email),
    );
    switch (result) {
      case SuccessResult<void>():
        emit(ResendEmailVerificationSuccess());
      case FailureResult<void>():
        emit(ResendEmailVerificationFailure(result.exception.toString()));
    }
  }
}
