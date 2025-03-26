import 'package:ecommerce_flower_app/core/base/base_state.dart';

class RegisterStates {
  BaseState? registerState;

  RegisterStates({this.registerState});

  RegisterStates copyWith({BaseState? registerState}) {
    return RegisterStates(registerState: registerState ?? this.registerState);
  }
}