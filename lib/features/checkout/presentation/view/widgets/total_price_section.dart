import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 64),
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            children: [
              Text(LocaleKeys.SubTotal.tr()),
              const Spacer(),
              Text("\$100"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(LocaleKeys.DeliveryFee.tr()),
              const Spacer(),
              Text("\$10"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(LocaleKeys.Discount.tr()),
              const Spacer(),
              Text("\$50"),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          Row(
            children: [
              Text(
                LocaleKeys.Total.tr(),
                style: AppTheme.appTheme.textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                "\$50",
                style: AppTheme.appTheme.textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.PlaceOrder.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
