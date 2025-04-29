import 'package:easy_localization/easy_localization.dart';

import '../../../features/about_us/domain/entity/about_section.dart';
import '../../../features/terms_and_conditions/domain/entity/term_section.dart';
import '../constants.dart';
import '../l10n/locale_keys.g.dart';

/// Utility class for parsing and validating JSON data into typed objects.
class DataLoader<T> {
  DataLoader._();

  /// Parses a JSON list into a list of type [T] using [fromJson].
  /// [data]: JSON data containing the list.
  /// [dataKey]: Key to access the list in [data].
  /// [fromJson]: Converts JSON to type [T].
  /// Returns: List of parsed objects.
  /// Throws: [Exception] if parsing fails, with index and error details.
  static List<T> parseData<T>(
    dynamic data,
    String dataKey,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    var items =
        (data[dataKey] as List)
            .asMap()
            .entries
            .map((entry) {
              try {
                return fromJson(entry.value);
              } catch (e) {
                throw Exception(
                  '${LocaleKeys.ErrorParsingTermSectionAtIndex.tr()} ${entry.key}: $e',
                );
              }
            })
            .cast<T>()
            .toList();

    return items;
  }

  /// Checks if [dataKey] exists and is not null in [data].
  /// [data]: JSON data to check.
  /// [dataKey]: Key to verify.
  /// Returns: True if [dataKey] exists and is not null, false otherwise.
  static bool checkIfData(dynamic data, String dataKey) {
    if (data[dataKey] == null) {
      return false;
    }
    return true;
  }

  /// Parses JSON terms data into a list of [TermSection].
  /// [data]: JSON data with terms list.
  /// Returns: List of parsed [TermSection] objects.
  static List<TermSection> parseTerms(dynamic data) {
    return parseData<TermSection>(
      data,
      Constants.termsAndConditionskey,
      (json) => TermSection.fromJson(json),
    );
  }

  /// Parses JSON about data into a list of [AboutSection].
  /// [data]: JSON data with about list.
  /// Returns: List of parsed [AboutSection] objects.
  static List<AboutSection> parseAbout(dynamic data) {
    return parseData<AboutSection>(
      data,
      Constants.aboutAppKey,
      (json) => AboutSection.fromJson(json),
    );
  }

  /// Checks if terms data exists in [data].
  /// [data]: JSON data to check.
  /// Returns: True if terms data exists, false otherwise.
  static bool checkTermsData(dynamic data) {
    return checkIfData(data, Constants.termsAndConditionskey);
  }

  /// Checks if about data exists in [data].
  /// [data]: JSON data to check.
  /// Returns: True if about data exists, false otherwise.
  static bool checkAboutData(dynamic data) {
    return checkIfData(data, Constants.aboutAppKey);
  }
}
