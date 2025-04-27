import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_lotties.dart';
import '../../../../../core/theme/app_theme.dart';

class OrdersErrorView extends StatelessWidget {
  final String error;

  const OrdersErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppLotties.errorScreen, width: 300, height: 300),
            const SizedBox(height: 32),
            Text(
              error,
              style: AppTheme.appTheme.textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                color: AppColors.red,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
