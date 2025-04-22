import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/checkout/presentation/view/widgets/payment_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.PaymentMethod.tr(),
            style: AppTheme.appTheme.textTheme.titleLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          PaymentItem(title: LocaleKeys.CashOnDelivery.tr()),
          const SizedBox(height: 8),
          PaymentItem(title: LocaleKeys.CreditCard.tr()),
        ],
      ),
    );
  }
}
