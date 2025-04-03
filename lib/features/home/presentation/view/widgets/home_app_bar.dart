import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import 'location_container.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 10.0),
      sliver: SliverAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.contain,
                child: SvgPicture.asset(AppIcons.logoSvg, height: 40.spMin),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 3,
              child: TextFormField(
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    AppIcons.searchSvg,
                    fit: BoxFit.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: AppColors.white[AppColors.colorCode70]!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: AppColors.white[AppColors.colorCode70]!,
                    ),
                  ),
                  hintText: LocaleKeys.Search.tr(),
                  contentPadding: const EdgeInsets.all(8.0),
                ),
              ),
            ),
          ],
        ),
        floating: true,
        pinned: false,
        snap: true,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: LocationContainer(),
        ),
      ),
    );
  }
}
