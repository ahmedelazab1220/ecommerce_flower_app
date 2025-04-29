import 'package:flutter/material.dart';

import '../../../domain/entity/term_section.dart';
import 'term_content_widget.dart';

class TermSectionWidget extends StatelessWidget {
  const TermSectionWidget({
    super.key,
    this.contentStyle,
    this.titleStyle,
    required this.isArabic,
    required this.term,
  });

  final dynamic contentStyle;
  final dynamic titleStyle;
  final bool isArabic;
  final TermSection term;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: contentStyle['backgroundColor'],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          term.title != null
              ? Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  isArabic ? term.title!.ar : term.title!.en,
                  style: TextStyle(
                    fontSize: titleStyle['fontSize'],
                    fontWeight: titleStyle['fontWeight'],
                    color: titleStyle['color'],
                  ),
                  textAlign: titleStyle['textAlign'],
                ),
              )
              : const SizedBox.shrink(),
          TermContentWidget(
            term: term,
            isArabic: isArabic,
            contentStyle: contentStyle,
          ),
        ],
      ),
    );
  }
}
