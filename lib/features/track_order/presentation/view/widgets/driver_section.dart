import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class DriverSection extends StatelessWidget {
  const DriverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.deliveryBoySvg,
                  height: 36,
                  width: 36,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mohammed Ali',
                      style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      LocaleKeys.IsYourDeevliveryHeroForToday.tr(),
                      style: AppTheme.appTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(AppIcons.callSvg, height: 24, width: 24),
                const SizedBox(width: 16),
                SvgPicture.asset(AppIcons.whatsappSvg, height: 20, width: 20),
              ],
            ),
          ],
        ),
        const SizedBox(height: 40),

        SvgPicture.asset(AppIcons.carSvg, height: 83, width: 213),
        const SizedBox(height: 40),
      ],
    );
  }
}
