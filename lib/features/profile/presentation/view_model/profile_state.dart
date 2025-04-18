import 'package:equatable/equatable.dart';

import '../../../../core/base/base_state.dart';

class ProfileState extends Equatable {
  final BaseState? baseState;
  final bool? isNotification;
  final BaseState? logoutState;
  final BaseState? guestState;

  const ProfileState({
    this.baseState,
    this.isNotification,
    this.logoutState,
    this.guestState,
  });

  @override
  List<Object?> get props => [
    baseState,
    isNotification,
    logoutState,
    guestState,
  ];

  ProfileState copyWith({
    BaseState? baseState,
    bool? isNotification,
    BaseState? logoutState,
    BaseState? guestState,
  }) {
    return ProfileState(
      baseState: baseState ?? this.baseState,
      isNotification: isNotification ?? this.isNotification,
      logoutState: logoutState ?? this.logoutState,
      guestState: guestState ?? this.guestState,
    );
  }
}

sealed class ProfileAction {}

class ProfileRequestAction extends ProfileAction {}

class LogoutRequestAction extends ProfileAction {}

class GuestStateRequestAction extends ProfileAction {}
