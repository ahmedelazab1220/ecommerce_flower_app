import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          LocaleKeys.AddToCart.tr(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
