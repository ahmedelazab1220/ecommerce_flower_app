import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/cubit/edit_profile_cubit.dart';

class EditProfileChangePassword extends StatefulWidget {
  const EditProfileChangePassword({super.key});

  @override
  State<EditProfileChangePassword> createState() =>
      _EditProfileChangePasswordState();
}

class _EditProfileChangePasswordState extends State<EditProfileChangePassword> {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<EditProfileCubit>();
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: LocaleKeys.Password.tr(),
        hintText: '********',
        hintStyle: const TextStyle(color: AppColors.black),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                viewModel.doIntent(
                  NavigationAction(
                    routeName: AppRoutes.resetPasswordRoute,
                    type: NavigationType.pushReplacement,
                  ),
                );
              },
              child: Text(
                LocaleKeys.Change.tr(),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.pink,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }
}
