import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final BaseState? registerState;
  final String selectedGender;

  const RegisterState({this.registerState, this.selectedGender = ''});

  RegisterState copyWith({BaseState? registerState, String? selectedGender}) {
    return RegisterState(
      registerState: registerState ?? this.registerState,
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }

  @override
  List<Object?> get props => [registerState, selectedGender];
}

sealed class RegisterAction {}

class GenderChangedAction extends RegisterAction {
  final String gender;
  GenderChangedAction({required this.gender});
}

class UserRegistrationAction extends RegisterAction {}

final class NavigationAction extends RegisterAction {
  final String routeName;
  final NavigationType type;

  NavigationAction({required this.routeName, this.type = NavigationType.push});
}
