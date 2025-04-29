import 'term_section_localized_string.dart';
import 'term_section_style.dart';

class TermSection {
  final String section;
  final dynamic content;
  final TermSectionStyle style;
  final TermSectionLocalizedString? title;

  TermSection({
    required this.section,
    required this.content,
    required this.style,
    this.title,
  });

  factory TermSection.fromJson(Map<String, dynamic> json) {
    if (json['section'] == null) {
      throw Exception('Missing section field in JSON');
    }
    if (json['content'] == null) {
      throw Exception(
        'Missing content field in JSON for section: ${json['section']}',
      );
    }
    if (json['style'] == null) {
      throw Exception(
        'Missing style field in JSON for section: ${json['section']}',
      );
    }

    return TermSection(
      section: json['section'] as String,
      content:
          json['content']['en'] is List
              ? (json['content']['en'] as List)
                  .asMap()
                  .map(
                    (i, item) => MapEntry(
                      i,
                      TermSectionLocalizedString(
                        en: item ?? '',
                        ar: json['content']['ar']?[i] ?? '',
                      ),
                    ),
                  )
                  .values
                  .toList()
              : TermSectionLocalizedString(
                en: json['content']['en'] ?? '',
                ar: json['content']['ar'] ?? '',
              ),
      style: TermSectionStyle.fromJson(json['style'] as Map<String, dynamic>),
      title:
          json['title'] != null
              ? TermSectionLocalizedString(
                en: json['title']['en'] ?? '',
                ar: json['title']['ar'] ?? '',
              )
              : null,
    );
  }
}
