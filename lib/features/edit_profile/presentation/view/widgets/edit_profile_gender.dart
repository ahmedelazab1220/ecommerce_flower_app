import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class EditProfileGender extends StatelessWidget {
  const EditProfileGender({super.key, required this.gender});

  final String gender;

  @override
  Widget build(BuildContext context) {
    final isFemale = gender.toLowerCase() == 'female';
    return Row(
      children: [
        Expanded(
          child: Text(
            LocaleKeys.Gender.tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.white[AppColors.colorCode90],
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Icon(
                isFemale
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: AppColors.pink,
              ),
              const SizedBox(width: 4),
              Text(
                LocaleKeys.Female.tr(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white[AppColors.colorCode90],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Row(
            children: [
              Icon(
                !isFemale
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: AppColors.pink,
              ),
              const SizedBox(width: 4),
              Text(
                LocaleKeys.Male.tr(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white[AppColors.colorCode90],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
