import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/checkout_cubit.dart';

class DeliveryTimeSection extends StatelessWidget {
  const DeliveryTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutCubit>();
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.DeliveryTime.tr(),
                style: AppTheme.appTheme.textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                LocaleKeys.Schedule.tr(),
                style: AppTheme.appTheme.textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  color: AppTheme.appTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.clockSvg, height: 24, width: 24),
              const SizedBox(width: 4),
              RichText(
                text: TextSpan(
                  text: "${LocaleKeys.Instant.tr()}, ",
                  style: AppTheme.appTheme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "${LocaleKeys.ArriveBy.tr()} 22 April 2025, ${viewModel.currentHours}:${viewModel.currentMinute} ${LocaleKeys.AM.tr()}",
                      style: AppTheme.appTheme.textTheme.titleLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.successGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
