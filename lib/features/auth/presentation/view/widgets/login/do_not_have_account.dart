import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../../core/utils/routes/routes.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.DonotHaveAnAccount.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
              child: Text(
                LocaleKeys.Signup.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.pink,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.pink,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
