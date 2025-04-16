import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class RegisterStates extends Equatable {
  final BaseState? registerState;
  final String selectedGender;

  const RegisterStates({this.registerState, this.selectedGender = ''});

  RegisterStates copyWith({BaseState? registerState, String? selectedGender}) {
    return RegisterStates(
      registerState: registerState ?? this.registerState,
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }

  @override
  List<Object?> get props => [registerState, selectedGender];
}

sealed class RegisterAction {}

class RegisterButtonPressedAction extends RegisterAction {}

class GenderChangedAction extends RegisterAction {
  final String gender;
  GenderChangedAction({required this.gender});
}

class NavigateToLoginAction extends RegisterAction {}

class UserRegistrationAction extends RegisterAction {}
