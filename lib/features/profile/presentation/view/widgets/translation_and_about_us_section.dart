import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import 'translation_bottom_sheet.dart';

class TranslationAndAboutUsSection extends StatelessWidget {
  const TranslationAndAboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          visualDensity: const VisualDensity(vertical: -2),
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            AppIcons.translateSvg,
            height: 24,
            width: 24,
          ),
          title: Text(
            LocaleKeys.Language.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: Text(
            context.locale.languageCode == Constants.ar
                ? LocaleKeys.Arabic.tr()
                : LocaleKeys.English.tr(),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.pink),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              isScrollControlled: true,
              builder: (translationContext) => const TranslationBottomSheet(),
            );
          },
        ),
        ListTile(
          visualDensity: const VisualDensity(vertical: -2),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.aboutUsRoute);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: EdgeInsets.zero,
          title: Text(
            LocaleKeys.AboutUs.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: SvgPicture.asset(AppIcons.backSvg, height: 24, width: 24),
        ),
        ListTile(
          visualDensity: const VisualDensity(vertical: -2),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.termsAndConditionsRoute);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: EdgeInsets.zero,
          title: Text(
            LocaleKeys.Terms_Conditions.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: SvgPicture.asset(AppIcons.backSvg, height: 24, width: 24),
        ),
        const SizedBox(height: 2),
        const Divider(thickness: 1, color: AppColors.lightGray),
      ],
    );
  }
}
