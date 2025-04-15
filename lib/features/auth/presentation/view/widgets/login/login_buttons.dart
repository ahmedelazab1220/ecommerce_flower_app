import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../view_model/login_cubit.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<LoginCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            viewModel.doIntent(LoginRequestAction());
          },
          child: Text(LocaleKeys.Login.tr()),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            viewModel.doIntent(GuestRequestAction());
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.white,
            side: BorderSide(color: AppColors.white[AppColors.colorCode90]!),
          ),
          child: Text(
            LocaleKeys.ContinueAsGuest.tr(),
            style: TextStyle(color: AppColors.white[AppColors.colorCode90]!),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
