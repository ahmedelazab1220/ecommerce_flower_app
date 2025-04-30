import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';

class HandleEmptyAddressState extends StatelessWidget {
  const HandleEmptyAddressState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off,
            size: 50,
            color: AppColors.black[AppColors.colorCode30],
          ),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.NoSavedAddressesFound.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 18,
              color: AppColors.black[AppColors.colorCode30],
            ),
          ),
        ],
      ),
    );
  }
}
