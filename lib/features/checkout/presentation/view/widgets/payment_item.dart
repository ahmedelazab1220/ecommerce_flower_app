import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  const PaymentItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withAlpha((0.2 * 255).toInt()),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Radio<int>(
            value: 0,
            groupValue: 0,
            activeColor: AppColors.pink,
            fillColor: WidgetStateProperty.all(AppColors.pink),
            onChanged: (int? value) {
              // Handle radio button change
            },
          ),
        ],
      ),
    );
  }
}
