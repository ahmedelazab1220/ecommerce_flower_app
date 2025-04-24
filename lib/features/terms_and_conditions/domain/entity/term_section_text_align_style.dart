class TermSectionTextAlignStyle {
  final String en;
  final String ar;

  TermSectionTextAlignStyle({required this.en, required this.ar});

  factory TermSectionTextAlignStyle.fromJson(Map<String, dynamic> json) {
    return TermSectionTextAlignStyle(
      en: json['en'] as String? ?? 'left',
      ar: json['ar'] as String? ?? 'right',
    );
  }
}
