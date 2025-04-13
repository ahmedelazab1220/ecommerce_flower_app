part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final BaseState? baseState;

  const ProfileState({this.baseState});

  @override
  List<Object?> get props => [baseState];

  ProfileState copyWith({BaseState? baseState}) {
    return ProfileState(baseState: baseState ?? this.baseState);
  }
}

sealed class ProfileAction {}

class ProfileRequestAction extends ProfileAction {}
