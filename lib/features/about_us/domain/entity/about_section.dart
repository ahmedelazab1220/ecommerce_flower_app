import 'about_section_localized_string.dart';
import 'about_section_style.dart';

class AboutSection {
  final String section;
  final dynamic content;
  final AboutSectionStyle style;
  final AboutSectionLocalizedString? title;

  AboutSection({
    required this.section,
    required this.content,
    required this.style,
    this.title,
  });

  factory AboutSection.fromJson(Map<String, dynamic> json) {
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

    return AboutSection(
      section: json['section'] as String,
      content:
          json['content']['en'] is List
              ? (json['content']['en'] as List)
                  .asMap()
                  .map(
                    (i, item) => MapEntry(
                      i,
                      AboutSectionLocalizedString(
                        en: item ?? '',
                        ar: json['content']['ar']?[i] ?? '',
                      ),
                    ),
                  )
                  .values
                  .toList()
              : AboutSectionLocalizedString(
                en: json['content']['en'] ?? '',
                ar: json['content']['ar'] ?? '',
              ),
      style: AboutSectionStyle.fromJson(json['style'] as Map<String, dynamic>),
      title:
          json['title'] != null
              ? AboutSectionLocalizedString(
                en: json['title']['en'] ?? '',
                ar: json['title']['ar'] ?? '',
              )
              : null,
    );
  }
}
