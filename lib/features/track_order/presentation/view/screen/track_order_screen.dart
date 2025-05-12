import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/theme/app_theme.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_icons.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderId;
  const TrackOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.TrackOrder.tr(),
          style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 40),
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
                          style: AppTheme.appTheme.textTheme.bodyLarge
                              ?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          LocaleKeys.IsYourDeevliveryHeroForToday.tr(),
                          style: AppTheme.appTheme.textTheme.bodyMedium
                              ?.copyWith(
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
                    SvgPicture.asset(
                      AppIcons.whatsappSvg,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            SvgPicture.asset(AppIcons.carSvg, height: 83, width: 213),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
