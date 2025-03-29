import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/font_responsive/font_responsive.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class HomeSharedTitleWidget extends StatelessWidget {
  const HomeSharedTitleWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: FontResponsive.getResponsiveFontSize(
                context: context,
                fontSize: 25,
              ),
            ),
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: onPressed,
            child: Text(LocaleKeys.ViewAll.tr()),
          ),
        ),
      ],
    );
  }
}
