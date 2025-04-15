import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class ResetPasswordState extends Equatable {
  final BaseState? resetPasswordState;
  final bool isFormValid;

  const ResetPasswordState({this.resetPasswordState, this.isFormValid = false});

  ResetPasswordState copyWith({
    BaseState? resetPasswordState,
    bool? isFormValid,
  }) {
    return ResetPasswordState(
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [resetPasswordState, isFormValid];
}

sealed class ResetPasswordAction {}

class ButtonPressedAction extends ResetPasswordAction {}

class FormChangedAction extends ResetPasswordAction {}
