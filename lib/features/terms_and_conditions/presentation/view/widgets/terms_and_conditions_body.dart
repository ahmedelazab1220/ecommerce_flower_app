import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/load_data_from_json_service/style_parser.dart';
import '../../../domain/entity/term_section.dart';
import 'term_section_widget.dart';

class TermsAndConditionsBody extends StatefulWidget {
  const TermsAndConditionsBody({super.key, required this.terms});

  final List<TermSection> terms;

  @override
  State<TermsAndConditionsBody> createState() => _TermsAndConditionsBodyState();
}

class _TermsAndConditionsBodyState extends State<TermsAndConditionsBody> {
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
            LocaleKeys.TermsAndConditionsForFloweryApp.tr(),
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.LastUpdatedTermsAndConditions.tr(),
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
                final contentStyle = StyleParser.buildTermStyle(
                  term.style,
                  isArabic,
                );
                final titleStyle =
                    term.style.title != null
                        ? StyleParser.buildTermStyle(
                          term.style.title!,
                          isArabic,
                        )
                        : contentStyle;

                return TermSectionWidget(
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
