import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/di/di.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../profile/domain/entity/user_entity.dart';
import '../view_model/cubit/edit_profile_cubit.dart';
import 'edit_profile_bloc_listener.dart';
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
    viewModel.emailController.text = widget.userEntity.email!;
    viewModel.phoneController.text = widget.userEntity.phone!;
    viewModel.firstNameController.text = widget.userEntity.firstName!;
    viewModel.lastNameController.text = widget.userEntity.lastName!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: EditProfileBlocListener(
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
