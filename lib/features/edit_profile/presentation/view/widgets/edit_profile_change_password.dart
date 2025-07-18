import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class EditProfileChangePassword extends StatefulWidget {
  const EditProfileChangePassword({super.key});

  @override
  State<EditProfileChangePassword> createState() =>
      _EditProfileChangePasswordState();
}

class _EditProfileChangePasswordState extends State<EditProfileChangePassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: LocaleKeys.Password.tr(),
        hintText: Constants.hiddenPassword,
        hintStyle: const TextStyle(color: AppColors.black),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.changePasswordRoute,
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
