import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/di/di.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../../domain/entity/user_entity.dart';
import '../view_model/cubit/edit_profile_cubit.dart';
import 'widgets/edit_profile_body.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int numberOfNotifications = 3;

  final viewModel = getIt<EditProfileCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.userEntity = widget.userEntity;
    viewModel.emailController.text = widget.userEntity.email;
    viewModel.phoneController.text = widget.userEntity.phone;
    viewModel.firstNameController.text = widget.userEntity.firstName;
    viewModel.lastNameController.text = widget.userEntity.lastName;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listenWhen: (previous, current) {
          return previous.editProfileState != current.editProfileState ||
              previous.uploadProfileImageState !=
                  current.uploadProfileImageState;
        },
        listener: (context, state) {
          final previous = context.read<EditProfileCubit>().state;

          if (state.editProfileState is BaseSuccessState &&
              previous.editProfileState != state.editProfileState) {
            showToast(title: 'Edit Profile Success', color: AppColors.pink);
          }

          if (state.uploadProfileImageState is BaseSuccessState &&
              previous.uploadProfileImageState !=
                  state.uploadProfileImageState) {
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
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.EditProfile.tr()),
            titleSpacing: 0,
            actions: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, size: 30),
                  ),
                  Positioned(
                    top: 4,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          numberOfNotifications.toString(),
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: EditProfileBody(userEntity: widget.userEntity),
        ),
      ),
    );
  }
}
