import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/load_data_from_json_service/style_parser.dart';
import '../../../domain/entity/about_section.dart';
import 'about_section_widget.dart';

class AboutUsBody extends StatefulWidget {
  const AboutUsBody({super.key, required this.terms});

  final List<AboutSection> terms;

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final isArabic = locale.languageCode == Constants.ar;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.AboutUsForFloweryApp.tr(),
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.LastUpdatedAboutUs.tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.black[AppColors.colorCode40],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: widget.terms.length,
              itemBuilder: (context, index) {
                final term = widget.terms[index];
                final contentStyle = StyleParser.buildAboutStyle(
                  term.style,
                  isArabic,
                );
                final titleStyle =
                    term.style.title != null
                        ? StyleParser.buildAboutStyle(
                          term.style.title!,
                          isArabic,
                        )
                        : contentStyle;

                return AboutSectionWidget(
                  isArabic: isArabic,
                  term: term,
                  contentStyle: contentStyle,
                  titleStyle: titleStyle,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
