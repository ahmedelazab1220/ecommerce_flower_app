import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../../core/utils/routes/routes.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              TextSpan(text: '${LocaleKeys.DonotHaveAnAccount.tr()} '),
              TextSpan(
                text: LocaleKeys.Signup.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.pink,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.pink,
                  fontWeight: FontWeight.w500,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.registerRoute,
                        );
                      },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
