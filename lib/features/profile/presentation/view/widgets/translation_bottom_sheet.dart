import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class TranslationBottomSheet extends StatelessWidget {
  const TranslationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = context.locale;

    Widget buildLanguageOption({
      required String label,
      required Locale locale,
    }) {
      bool isSelected = currentLocale == locale;

      return GestureDetector(
        onTap: () {
          final newLocale =
              context.locale.languageCode == Constants.en
                  ? const Locale(Constants.ar)
                  : const Locale(Constants.en);
          context.setLocale(newLocale);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.white[AppColors.colorCode60]!,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isSelected ? AppColors.pink : AppColors.black,
                ),
              ),
              if (isSelected)
                const Icon(Icons.radio_button_checked, color: AppColors.pink)
              else
                const Icon(Icons.radio_button_unchecked, color: AppColors.gray),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment:
                context.locale.languageCode == Constants.ar
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
            child: Text(
              LocaleKeys.ChangeLanguage.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.pink,
              ),
            ),
          ),
          const SizedBox(height: 24),
          buildLanguageOption(
            label: LocaleKeys.Arabic.tr(),
            locale: const Locale(Constants.ar),
          ),
          buildLanguageOption(
            label: LocaleKeys.English.tr(),
            locale: const Locale(Constants.en),
          ),
        ],
      ),
    );
  }
}
