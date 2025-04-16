import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppIcons.transactionOrderSvg,
                    height: 24.spMax,
                    width: 24.spMax,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    LocaleKeys.MyOrders.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              IconButton(
                icon: SvgPicture.asset(
                  AppIcons.backSvg,
                  height: 24.spMax,
                  width: 24.spMax,
                ),
                onPressed: () {
                  // Handle settings button press
                },
              ),
            ],
          ),
          onTap: () {},
        ),
        const SizedBox(height: 4),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppIcons.locationSvg,
                    height: 24.spMax,
                    width: 24.spMax,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    LocaleKeys.SaveAddress.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              IconButton(
                icon: SvgPicture.asset(
                  AppIcons.backSvg,
                  height: 24.spMax,
                  width: 24.spMax,
                ),
                onPressed: () {
                  // Handle settings button press
                },
              ),
            ],
          ),
          onTap: () {},
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 1, color: AppColors.lightGray),
      ],
    );
  }
}
