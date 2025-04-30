import 'package:flutter/material.dart';

import '../../../features/about_us/domain/entity/about_section_style.dart';
import '../../../features/terms_and_conditions/domain/entity/term_section_style.dart';

/// Utility class for parsing style entities into Flutter-compatible style maps.
class StyleParser {
  StyleParser._();

  /// Parses a style entity into a map of Flutter style properties.
  /// [style]: The style entity to parse.
  /// [isArabic]: Whether to use Arabic text alignment.
  /// Returns: A map with fontSize, fontWeight, color, backgroundColor, and textAlign.
  static Map<String, dynamic> parseStyle(dynamic style, bool isArabic) {
    return {
      'fontSize': style.fontSize?.toDouble() ?? 16.0,
      'fontWeight':
          style.fontWeight == 'bold' ? FontWeight.bold : FontWeight.normal,
      'color': _parseColor(style.color ?? '#000000'),
      'backgroundColor': _parseColor(style.backgroundColor ?? '#FFFFFF'),
      'textAlign': _parseTextAlign(
        isArabic ? style.textAlign.ar : style.textAlign.en,
      ),
    };
  }

  /// Converts a text alignment string to a [TextAlign] value.
  /// [align]: The alignment string ('center', 'right', 'left', or null).
  /// Returns: Corresponding [TextAlign], defaults to [TextAlign.left].
  static TextAlign _parseTextAlign(String? align) {
    switch (align) {
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      case 'left':
      default:
        return TextAlign.left;
    }
  }

  /// Parses a hex color string into a [Color] object.
  /// [hex]: The hex color string (e.g., '#FFFFFF' or 'FFFFFF').
  /// Returns: A [Color] object, with opacity defaulting to FF if not specified.
  static Color _parseColor(String hex) {
    final buffer = StringBuffer();
    if (hex.startsWith('#')) {
      hex = hex.substring(1);
    }
    if (hex.length == 6) buffer.write('FF');
    buffer.write(hex);
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Builds a style map for an [AboutSectionStyle].
  /// [style]: The [AboutSectionStyle] to parse.
  /// [isArabic]: Whether to use Arabic text alignment.
  /// Returns: A map of style properties for Flutter widgets.
  static Map<String, dynamic> buildAboutStyle(
    AboutSectionStyle style,
    bool isArabic,
  ) {
    return StyleParser.parseStyle(style, isArabic);
  }

  /// Builds a style map for a [TermSectionStyle].
  /// [style]: The [TermSectionStyle] to parse.
  /// [isArabic]: Whether to use Arabic text alignment.
  /// Returns: A map of style properties for Flutter widgets.
  static Map<String, dynamic> buildTermStyle(
    TermSectionStyle style,
    bool isArabic,
  ) {
    return StyleParser.parseStyle(style, isArabic);
  }
}
