import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_filteration.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
              hintText: LocaleKeys.Search.tr(),
              hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.white[AppColors.colorCode70],
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.white[AppColors.colorCode70]!,
              ),
              enabled: false,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.white[AppColors.colorCode70]!,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              BottomSheetFilteration.showModelBottomSheet(context);
            },
            borderRadius: BorderRadius.circular(8),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20, right: 12),
                prefixIcon: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.sort,
                    color: AppColors.white[AppColors.colorCode70]!,
                  ),
                ),
                enabled: false,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.white[AppColors.colorCode70]!,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
