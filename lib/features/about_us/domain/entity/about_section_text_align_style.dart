class AboutSectionTextAlignStyle {
  final String en;
  final String ar;

  AboutSectionTextAlignStyle({required this.en, required this.ar});

  factory AboutSectionTextAlignStyle.fromJson(Map<String, dynamic> json) {
    return AboutSectionTextAlignStyle(
      en: json['en'] as String? ?? 'left',
      ar: json['ar'] as String? ?? 'right',
    );
  }
}
