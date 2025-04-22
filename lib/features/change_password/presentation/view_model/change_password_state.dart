import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  final BaseState? changePasswordState;
  final bool isFormValid;

  const ChangePasswordState({
    this.changePasswordState,
    this.isFormValid = false,
  });

  ChangePasswordState copyWith({
    BaseState? changePasswordState,
    bool? isFormValid,
  }) {
    return ChangePasswordState(
      changePasswordState: changePasswordState ?? this.changePasswordState,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [changePasswordState, isFormValid];
}

sealed class ChangePasswordAction {}

final class ButtonPressedAction extends ChangePasswordAction {}

final class FormChangedAction extends ChangePasswordAction {}
