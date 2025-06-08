import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
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
          showToast(
            title: LocaleKeys.SuccessEditProfile.tr(),
            color: AppColors.pink,
          );
        }

        if (state.uploadProfileImageState is BaseSuccessState &&
            state.lastActionType == EditProfileActionType.uploadImage) {
          showToast(
            title: LocaleKeys.SuccessUploadProfileImage.tr(),
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
      },
      child: child,
    );
  }
}
