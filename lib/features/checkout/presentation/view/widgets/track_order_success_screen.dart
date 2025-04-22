import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/checkout/presentation/view/widgets/ripple_animation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class TrackOrderSuccessScreen extends StatelessWidget {
  const TrackOrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.TrackOrder.tr())),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            const RippleAnimation(),
            const SizedBox(height: 40),
            Center(
              child: Text(
                LocaleKeys.YourOrderPlacedSuccessfully.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                LocaleKeys.TrackOrder.tr(),
                style: AppTheme.appTheme.textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
