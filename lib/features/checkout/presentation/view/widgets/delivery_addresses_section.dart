import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import 'address_item.dart';

class DeliveryAddressesSection extends StatelessWidget {
  const DeliveryAddressesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.DeliveryAddress.tr(),
            style: AppTheme.appTheme.textTheme.titleLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return AddressItem(index: index);
            },
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: AppTheme.appTheme.elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.all(AppColors.white),
              foregroundColor: WidgetStateProperty.all(AppColors.pink),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(vertical: 6),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: const BorderSide(color: AppColors.lightGray),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.addSvg, height: 14, width: 14),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.AddNew.tr(),
                  style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.pink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
