import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class HandleTermsEmptyState extends StatelessWidget {
  const HandleTermsEmptyState({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info_outline, size: 80, color: AppColors.pink),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.NoTermsAvailable.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.NoTermsAvailable.tr(),
              style: TextStyle(
                fontSize: 14,
                color: AppColors.black[AppColors.colorCode70],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              child: Text(LocaleKeys.Retry.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
