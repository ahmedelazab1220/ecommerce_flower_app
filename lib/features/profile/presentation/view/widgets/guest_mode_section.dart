import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';

class GuestModeSection extends StatelessWidget {
  const GuestModeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.YouAreInGuestMode.tr(),
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.PleaseLoginToAccessAllFeatures.tr(),
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
              child: Text(LocaleKeys.Login.tr()),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
