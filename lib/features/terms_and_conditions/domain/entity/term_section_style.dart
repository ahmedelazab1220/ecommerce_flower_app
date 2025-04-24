import 'term_section_text_align_style.dart';

class TermSectionStyle {
  final double? fontSize;
  final String? fontWeight;
  final String? color;
  final String? backgroundColor;
  final TermSectionTextAlignStyle textAlign;
  final TermSectionStyle? title;

  TermSectionStyle({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.backgroundColor,
    required this.textAlign,
    this.title,
  });

  factory TermSectionStyle.fromJson(Map<String, dynamic> json) {
    final textAlignJson =
        json['textAlign'] as Map<String, dynamic>? ??
        {'en': 'left', 'ar': 'right'};

    return TermSectionStyle(
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] as String?,
      color: json['color'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      textAlign: TermSectionTextAlignStyle.fromJson(textAlignJson),
      title:
          json['title'] != null
              ? TermSectionStyle.fromJson(json['title'] as Map<String, dynamic>)
              : null,
    );
  }
}
