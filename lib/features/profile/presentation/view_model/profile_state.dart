import 'package:equatable/equatable.dart';

import '../../../../core/base/base_state.dart';

class ProfileState extends Equatable {
  final BaseState? baseState;
  final bool? isNotification;
  final BaseState? logoutState;

  const ProfileState({this.baseState, this.isNotification, this.logoutState});

  @override
  List<Object?> get props => [baseState, isNotification, logoutState];

  ProfileState copyWith({
    BaseState? baseState,
    bool? isNotification,
    BaseState? logoutState,
  }) {
    return ProfileState(
      baseState: baseState ?? this.baseState,
      isNotification: isNotification ?? this.isNotification,
      logoutState: logoutState ?? this.logoutState,
    );
  }
}

sealed class ProfileAction {}

class ProfileRequestAction extends ProfileAction {}

class LogoutRequestAction extends ProfileAction {}
