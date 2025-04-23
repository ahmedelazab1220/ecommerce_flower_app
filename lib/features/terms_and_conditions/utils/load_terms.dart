import 'package:easy_localization/easy_localization.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/l10n/locale_keys.g.dart';
import '../domain/entity/term_section.dart';

/// A utility class for loading and parsing terms and conditions data from JSON.
///
/// This class provides static methods to validate and parse JSON data into a list of
/// [TermSection] objects. It is designed to be used in conjunction with a repository
/// or screen to handle the data loading process for terms and conditions.
class LoadTerms {
  LoadTerms._();

  /// Parses JSON data into a list of [TermSection] objects.
  ///
  /// This method takes the decoded JSON data and extracts the terms and conditions
  /// list from the key defined in [Constants.keyTermsAndConditions]. It then maps
  /// each entry to a [TermSection] object using [TermSection.fromJson].
  ///
  /// Parameters:
  ///   - [data]: The decoded JSON data (as a dynamic object) containing the terms
  ///     and conditions list under the key [Constants.keyTermsAndConditions].
  ///
  /// Returns:
  ///   A [List<TermSection>] containing the parsed terms and conditions sections.
  ///
  /// Throws:
  ///   - [Exception] if parsing fails for any entry in the terms list, including the
  ///     index of the failed entry and the error message.
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

  /// Checks if the JSON data contains the expected terms and conditions structure.
  ///
  /// Validates the decoded JSON data by checking for the presence of the key defined
  /// in [Constants.keyTermsAndConditions]. This ensures the data is in the expected
  /// format before attempting to parse it.
  ///
  /// Parameters:
  ///   - [data]: The decoded JSON data (as a dynamic object) to validate.
  ///
  /// Returns:
  ///   A [bool] indicating whether the data is valid (`true` if the key exists,
  ///   `false` otherwise).
  static bool checkIfData(dynamic data) {
    if (data[Constants.keyTermsAndConditions] == null) {
      return false;
    }
    return true;
  }
}
