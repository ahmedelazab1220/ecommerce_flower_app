import 'package:equatable/equatable.dart';

import '../../../../core/base/base_state.dart';

class ResetPasswordState extends Equatable {
  final BaseState? baseState;

  const ResetPasswordState({this.baseState});

  ResetPasswordState copyWith({BaseState? baseState}) {
    return ResetPasswordState(baseState: baseState ?? this.baseState);
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class ResetPasswordAction {}

class ResetPasswordRequestAction extends ResetPasswordAction {
  final String email;

  ResetPasswordRequestAction(this.email);
}
