part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  final BaseState? editProfileState;
  final BaseState? uploadProfileImageState;
  final EditProfileActionType? lastActionType;

  const EditProfileState({
    this.editProfileState,
    this.uploadProfileImageState,
    this.lastActionType,
  });

  EditProfileState copyWith({
    BaseState? editProfileState,
    BaseState? uploadProfileImageState,
    EditProfileActionType? lastActionType,
  }) {
    return EditProfileState(
      editProfileState: editProfileState ?? this.editProfileState,
      uploadProfileImageState:
          uploadProfileImageState ?? this.uploadProfileImageState,
      lastActionType: lastActionType ?? this.lastActionType,
    );
  }

  @override
  List<Object?> get props => [editProfileState, uploadProfileImageState];
}

sealed class EditProfileAction {}

final class FormDataChanged extends EditProfileAction {}

final class EditProfileRequestAction extends EditProfileAction {}

final class UploadProfileImageRequestAction extends EditProfileAction {
  final File image;

  UploadProfileImageRequestAction({required this.image});
}

final class NavigationAction extends EditProfileAction {
  final String routeName;
  final NavigationType type;

  NavigationAction({required this.routeName, required this.type});
}

enum EditProfileActionType { editProfile, uploadImage, none }
