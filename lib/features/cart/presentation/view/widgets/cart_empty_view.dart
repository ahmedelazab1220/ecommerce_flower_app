import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_lotties.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppLotties.cartEmpty, width: 300, height: 300),
            const SizedBox(height: 32),
            Text(
              LocaleKeys.YourCartIsEmpty.tr(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                color: AppColors.pink,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              LocaleKeys.ExploreItemsAndAddThemToYourCart.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.pink,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
