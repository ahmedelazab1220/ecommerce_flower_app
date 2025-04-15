part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final BaseState? baseState;
  final bool? isNotification;

  const ProfileState({this.baseState, this.isNotification});

  @override
  List<Object?> get props => [baseState, isNotification];

  ProfileState copyWith({BaseState? baseState, bool? isNotification}) {
    return ProfileState(
      baseState: baseState ?? this.baseState,
      isNotification: isNotification ?? this.isNotification,
    );
  }
}

sealed class ProfileAction {}

class ProfileRequestAction extends ProfileAction {}
