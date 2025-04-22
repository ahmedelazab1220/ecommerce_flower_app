import 'package:flutter/material.dart';

import '../domain/entity/term_section_style.dart';

class TermsStyleParser {
  TermsStyleParser._();

  static Map<String, dynamic> parseStyle(
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
}
