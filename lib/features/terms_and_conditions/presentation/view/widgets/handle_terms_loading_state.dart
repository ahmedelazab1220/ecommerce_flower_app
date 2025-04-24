import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class HandleTermsLoadingState extends StatelessWidget {
  const HandleTermsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.pink),
            ),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.LoadingTerms.tr(),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.PleaseWait.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.black[AppColors.colorCode40],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
