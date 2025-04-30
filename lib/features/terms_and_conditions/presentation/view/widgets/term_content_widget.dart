import 'package:flutter/material.dart';

import '../../../domain/entity/term_section.dart';

class TermContentWidget extends StatelessWidget {
  const TermContentWidget({
    super.key,
    required this.term,
    required this.isArabic,
    this.contentStyle,
  });

  final TermSection term;
  final bool isArabic;
  final dynamic contentStyle;

  @override
  Widget build(BuildContext context) {
    List<Widget> contentWidgets = [];

    if (term.content is String) {
      contentWidgets.add(
        Text(
          isArabic ? term.content.ar : term.content.en,
          style: TextStyle(
            fontSize: contentStyle['fontSize'],
            fontWeight: contentStyle['fontWeight'],
            color: contentStyle['color'],
          ),
          textAlign: contentStyle['textAlign'],
        ),
      );
    } else if (term.content is List) {
      for (var item in (term.content as List)) {
        contentWidgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              isArabic ? item.ar : item.en,
              style: TextStyle(
                fontSize: contentStyle['fontSize'],
                fontWeight: contentStyle['fontWeight'],
                color: contentStyle['color'],
              ),
              textAlign: contentStyle['textAlign'],
            ),
          ),
        );
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contentWidgets,
    );
  }
}
