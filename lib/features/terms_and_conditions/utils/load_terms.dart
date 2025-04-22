import 'package:easy_localization/easy_localization.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/l10n/locale_keys.g.dart';
import '../domain/entity/term_section.dart';

class LoadTerms {
  LoadTerms._();

  static List<TermSection> parseData(dynamic data) {
    var terms =
        (data[Constants.keyTermsAndConditions] as List)
            .asMap()
            .entries
            .map((entry) {
              try {
                return TermSection.fromJson(entry.value);
              } catch (e) {
                throw Exception(
                  '${LocaleKeys.ErrorParsingTermSectionAtIndex.tr()} ${entry.key}: $e',
                );
              }
            })
            .cast<TermSection>()
            .toList();

    return terms;
  }

  static bool checkIfData(dynamic data) {
    if (data[Constants.keyTermsAndConditions] == null) {
      return false;
    }
    return true;
  }
}
