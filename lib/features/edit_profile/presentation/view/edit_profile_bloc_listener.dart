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
      listenWhen: (previous, current) {
        return previous.editProfileState != current.editProfileState ||
            previous.uploadProfileImageState != current.uploadProfileImageState;
      },
      listener: (context, state) {
        final previous = context.read<EditProfileCubit>().state;

        if (state.editProfileState is BaseSuccessState &&
            previous.editProfileState != state.editProfileState) {
          showToast(title: 'Edit Profile Success', color: AppColors.pink);
        }

        if (state.uploadProfileImageState is BaseSuccessState &&
            previous.uploadProfileImageState != state.uploadProfileImageState) {
          showToast(
            title: 'Upload Profile Image Success',
            color: AppColors.pink,
          );
        }

        if ((state.editProfileState is BaseErrorState ||
                state.uploadProfileImageState is BaseErrorState) &&
            (previous.editProfileState != state.editProfileState ||
                previous.uploadProfileImageState !=
                    state.uploadProfileImageState)) {
          final errorState =
              state.editProfileState is BaseErrorState
                  ? state.editProfileState as BaseErrorState
                  : state.uploadProfileImageState as BaseErrorState;

          showToast(title: errorState.errorMessage, color: AppColors.red);
        }

        if (state.editProfileState is BaseNavigationState &&
            previous.editProfileState != state.editProfileState) {
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
