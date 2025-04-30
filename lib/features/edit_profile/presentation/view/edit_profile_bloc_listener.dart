import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/dialogs/app_toast.dart';
import '../../../../core/assets/app_colors.dart';
import '../view_model/cubit/edit_profile_cubit.dart';

class EditProfileBlocListener extends StatelessWidget {
  const EditProfileBlocListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.editProfileState is BaseSuccessState &&
            state.lastActionType == EditProfileActionType.editProfile) {
          showToast(title: 'Edit Profile Success', color: AppColors.pink);
        }

        if (state.uploadProfileImageState is BaseSuccessState &&
            state.lastActionType == EditProfileActionType.uploadImage) {
          showToast(
            title: 'Upload Profile Image Success',
            color: AppColors.pink,
          );
        }

        if (state.editProfileState is BaseErrorState &&
            state.lastActionType == EditProfileActionType.editProfile) {
          final errorState = state.editProfileState as BaseErrorState;

          showToast(title: errorState.errorMessage, color: AppColors.red);
        }

        if (state.uploadProfileImageState is BaseErrorState &&
            state.lastActionType == EditProfileActionType.uploadImage) {
          final errorState = state.uploadProfileImageState as BaseErrorState;

          showToast(title: errorState.errorMessage, color: AppColors.red);
        }

        if (state.editProfileState is BaseNavigationState) {
          final navState = state.editProfileState as BaseNavigationState;

          switch (navState.type) {
            case NavigationType.pop:
              Navigator.pop(context);
              break;
            case NavigationType.push:
              Navigator.pushNamed(context, navState.routeName);
              break;
            case NavigationType.pushReplacement:
              Navigator.pushReplacementNamed(context, navState.routeName);
              break;
          }
        }
      },
      child: child,
    );
  }
}
