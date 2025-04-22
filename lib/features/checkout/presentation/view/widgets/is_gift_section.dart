import 'package:animated_visibility/animated_visibility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/checkout_cubit.dart';

class IsGiftSection extends StatelessWidget {
  const IsGiftSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CheckoutCubit>();
    final isCreditSelected = cubit.selectedPaymentIndex == 1;
    final isGift = cubit.isGift;

    return AnimatedVisibility(
      visible: isCreditSelected,
      enter: expandVertically(alignment: -1),
      exit: shrinkVertically(alignment: -1),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              visualDensity: const VisualDensity(vertical: -2),
              onTap: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              contentPadding: EdgeInsets.zero,
              leading: Switch(
                value: isGift,
                onChanged: (val) => cubit.toggleGift(val),
                activeColor: AppColors.pink,
                activeTrackColor: AppColors.pink[AppColors.colorCode40],
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.black.withValues(alpha: 0.1),
                padding: const EdgeInsets.all(1.0),
                trackOutlineColor: WidgetStateProperty.all(
                  AppColors.pink.withAlpha(1),
                ),
              ),
              title: Text(
                LocaleKeys.ItIsAGift.tr(),
                style: AppTheme.appTheme.textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedVisibility(
              visible: isGift,
              enter: expandVertically(alignment: -1),
              exit: shrinkVertically(alignment: -1),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: LocaleKeys.Name.tr(),
                      hintText: LocaleKeys.EnterTheName.tr(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: LocaleKeys.PhoneNumber.tr(),
                      hintText: LocaleKeys.EnterThePhoneNumber.tr(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
