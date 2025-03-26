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
    : super(ForgetPasswordInitial());

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoading());
      final result = await forgetPasswordUsecase(
        ForgetPasswordRequestDto(email: emailController.text),
      );
      switch (result) {
        case SuccessResult<void>():
          emit(ForgetPasswordSuccess());
        case FailureResult<void>():
          emit(ForgetPasswordFailure(message: result.exception.toString()));
      }
    }
  }
}
