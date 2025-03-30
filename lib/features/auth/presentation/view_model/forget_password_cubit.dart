import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/validator/validator.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUsecase;
  final Validator validator = Validator();

  ForgetPasswordCubit(this.forgetPasswordUsecase)
    : super(ForgetPasswordState(baseState: BaseInitialState()));

  void doIntent(ForgetPasswordAction action) {
    switch (action) {
      case ForgetPasswordRequestAction():
        _forgetPassword();
        break;
    }
  }

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(baseState: BaseLoadingState()));
      final result = await forgetPasswordUsecase(
        ForgetPasswordRequestDto(email: emailController.text),
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
    emailController.dispose();
    return super.close();
  }
}
