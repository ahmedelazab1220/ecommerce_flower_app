import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class ArrivalSection extends StatelessWidget {
  const ArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.EstimatedArrival.tr(),
          style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.gray,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "03 Sep 2024, 11:00 AM",
          style: AppTheme.appTheme.textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 40),
      ],
    );
  }
}
