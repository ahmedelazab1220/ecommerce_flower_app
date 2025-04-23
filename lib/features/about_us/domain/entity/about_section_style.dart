import 'about_section_text_align_style.dart';

class AboutSectionStyle {
  final double? fontSize;
  final String? fontWeight;
  final String? color;
  final String? backgroundColor;
  final AboutSectionTextAlignStyle textAlign;
  final AboutSectionStyle? title;

  AboutSectionStyle({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.backgroundColor,
    required this.textAlign,
    this.title,
  });

  factory AboutSectionStyle.fromJson(Map<String, dynamic> json) {
    final textAlignJson =
        json['textAlign'] as Map<String, dynamic>? ??
        {'en': 'left', 'ar': 'right'};

    return AboutSectionStyle(
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] as String?,
      color: json['color'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      textAlign: AboutSectionTextAlignStyle.fromJson(textAlignJson),
      title:
          json['title'] != null
              ? AboutSectionStyle.fromJson(
                json['title'] as Map<String, dynamic>,
              )
              : null,
    );
  }
}
