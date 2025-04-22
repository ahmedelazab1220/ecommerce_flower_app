import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class IsGiftSection extends StatelessWidget {
  const IsGiftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            visualDensity: const VisualDensity(vertical: -2),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            contentPadding: EdgeInsets.zero,
            leading: Switch(
              value: false,
              onChanged: null,
              activeColor: AppColors.pink,
              activeTrackColor: AppColors.pink,
              inactiveThumbColor: AppColors.white,
              inactiveTrackColor: AppColors.black.withValues(alpha: 0.1),
              padding: const EdgeInsets.all(1.0),
              trackOutlineColor: WidgetStateProperty.all(
                AppColors.pink.withAlpha(1),
              ),
            ),
            title: Text(
              LocaleKeys.ItIsAGift.tr(),
              style: AppTheme.appTheme.textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: null,
            validator: (value) => null,
            decoration: InputDecoration(
              labelText: LocaleKeys.Name.tr(),
              hintText: LocaleKeys.EnterTheName.tr(),
            ),
            onTapOutside:
                (event) => FocusManager.instance.primaryFocus?.unfocus(),
          ),
          const SizedBox(height: 24),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: null,
            validator: (value) => null,
            decoration: InputDecoration(
              labelText: LocaleKeys.PhoneNumber.tr(),
              hintText: LocaleKeys.EnterThePhoneNumber.tr(),
            ),
            onTapOutside:
                (event) => FocusManager.instance.primaryFocus?.unfocus(),
          ),
        ],
      ),
    );
  }
}
