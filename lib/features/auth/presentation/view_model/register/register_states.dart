import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class RegisterStates extends Equatable {
  final BaseState? registerState;

  const RegisterStates({this.registerState});

  RegisterStates copyWith({BaseState? registerState}) {
    return RegisterStates(registerState: registerState ?? this.registerState);
  }

  @override
  List<Object?> get props => [registerState];
}
