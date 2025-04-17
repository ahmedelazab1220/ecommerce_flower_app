import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class OrderSection extends StatelessWidget {
  const OrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          visualDensity: const VisualDensity(vertical: -2),
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          leading: SvgPicture.asset(
            AppIcons.transactionOrderSvg,
            height: 24,
            width: 24,
          ),
          title: Text(
            LocaleKeys.MyOrders.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: SvgPicture.asset(AppIcons.backSvg),
        ),
        ListTile(
          visualDensity: const VisualDensity(vertical: -2),
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          leading: SvgPicture.asset(
            AppIcons.locationSvg,
            height: 24,
            width: 24,
          ),
          title: Text(
            LocaleKeys.SaveAddress.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: SvgPicture.asset(AppIcons.backSvg),
        ),
        const SizedBox(height: 2),
        const Divider(thickness: 1, color: AppColors.lightGray),
      ],
    );
  }
}
