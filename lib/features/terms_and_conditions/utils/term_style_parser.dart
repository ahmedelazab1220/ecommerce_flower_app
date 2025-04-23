import 'package:flutter/material.dart';

import '../domain/entity/term_section_style.dart';

/// A utility class for parsing [TermSectionStyle] objects into Flutter-compatible style properties.
///
/// This class provides static methods to transform [TermSectionStyle] objects into a map of style
/// properties suitable for styling Flutter widgets, such as [Text] and [Container]. It supports
/// properties like font size, font weight, text color, background color, and text alignment, with
/// built-in handling for Arabic (right-to-left) and English (left-to-right) text directions.
///
/// The class is designed to be used statically and cannot be instantiated.
class TermsStyleParser {
  TermsStyleParser._();

  /// Converts a [TermSectionStyle] into a map of style properties for Flutter widgets.
  ///
  /// Transforms the provided [TermSectionStyle] into a map containing style properties such as
  /// font size, font weight, text color, background color, and text alignment. The method supports
  /// bidirectional text alignment based on the [isArabic] parameter, which determines whether to
  /// apply Arabic (RTL) or English (LTR) alignment settings from [TermSectionStyle.textAlign].
  ///
  /// The resulting map includes the following keys:
  ///   - `fontSize`: A [double] representing the font size (defaults to 16.0 if null).
  ///   - `fontWeight`: A [FontWeight], either [FontWeight.bold] or [FontWeight.normal], based on
  ///     the [TermSectionStyle.fontWeight] value.
  ///   - `color`: A [Color] for the text (defaults to black if [TermSectionStyle.color] is null).
  ///   - `backgroundColor`: A [Color] for the background (defaults to white if
  ///     [TermSectionStyle.backgroundColor] is null).
  ///   - `textAlign`: A [TextAlign] value determined by the [isArabic] parameter and the
  ///     [TermSectionStyle.textAlign] settings.
  ///
  /// Parameters:
  ///   - [style]: The [TermSectionStyle] object containing the style information to parse.
  ///   - [isArabic]: A [bool] indicating whether to use Arabic (RTL) text alignment (`true`) or
  ///     English (LTR) text alignment (`false`).
  ///
  /// Returns:
  ///   A [Map<String, dynamic>] containing the parsed style properties for use in Flutter widgets.
  static Map<String, dynamic> _parseStyle(
    TermSectionStyle style,
    bool isArabic,
  ) {
    return {
      'fontSize': style.fontSize?.toDouble() ?? 16.0,
      'fontWeight':
          style.fontWeight == 'bold' ? FontWeight.bold : FontWeight.normal,
      'color': _parseColor(style.color ?? '#000000'),
      'backgroundColor': _parseColor(style.backgroundColor ?? '#FFFFFF'),
      'textAlign':
          isArabic
              ? (style.textAlign.ar == 'center'
                  ? TextAlign.center
                  : style.textAlign.ar == 'left'
                  ? TextAlign.left
                  : TextAlign.right)
              : (style.textAlign.en == 'center'
                  ? TextAlign.center
                  : style.textAlign.en == 'right'
                  ? TextAlign.right
                  : TextAlign.left),
    };
  }

  /// Converts a hexadecimal color string into a Flutter [Color] object.
  ///
  /// Parses a hexadecimal color string (e.g., '#FF0000' or 'FF0000') into a [Color] object.
  /// If the hex string lacks an alpha channel (i.e., has 6 characters), an opaque alpha value
  /// ('FF') is prepended. The '#' prefix, if present, is removed before parsing.
  ///
  /// Parameters:
  ///   - [hex]: A [String] representing the hexadecimal color value (with or without a '#' prefix).
  ///
  /// Returns:
  ///   A [Color] object representing the parsed color value.
  static Color _parseColor(String hex) {
    final buffer = StringBuffer();
    if (hex.startsWith('#')) {
      hex = hex.substring(1);
    }
    if (hex.length == 6) {
      buffer.write('FF');
    }
    buffer.write(hex);
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Builds a style map from a [TermSectionStyle] for use in Flutter widgets.
  ///
  /// This method serves as the public interface for parsing a [TermSectionStyle] object into
  /// a map of style properties. It delegates to [parseStyle] to perform the actual conversion,
  /// providing a consistent API for external consumers to style Flutter widgets like [Text]
  /// and [Container] with properties such as font size, font weight, text color, background
  /// color, and text alignment.
  ///
  /// The resulting map includes the following keys:
  ///   - `fontSize`: A [double] representing the font size (defaults to 16.0 if null).
  ///   - `fontWeight`: A [FontWeight], either [FontWeight.bold] or [FontWeight.normal].
  ///   - `color`: A [Color] for the text (defaults to black if null).
  ///   - `backgroundColor`: A [Color] for the background (defaults to white if null).
  ///   - `textAlign`: A [TextAlign] value based on the [isArabic] parameter and the
  ///     [TermSectionStyle.textAlign] settings.
  ///
  /// Parameters:
  ///   - [termSectionStyle]: The [TermSectionStyle] object containing the style information
  ///     to parse.
  ///   - [isArabic]: A [bool] indicating whether to use Arabic (RTL) text alignment (`true`) or
  ///     English (LTR) text alignment (`false`).
  ///
  /// Returns:
  ///   A [Map<String, dynamic>] containing the parsed style properties for use in Flutter widgets.
  ///
  /// See also:
  ///   - [parseStyle], the internal method that performs the actual style parsing.
  static Map<String, dynamic> buildStyle(
    TermSectionStyle termSectionStyle,
    bool isArabic,
  ) {
    return _parseStyle(termSectionStyle, isArabic);
  }
}
