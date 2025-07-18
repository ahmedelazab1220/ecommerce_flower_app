import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/email_verification/email_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../view_model/email_verification/email_verification_cubit.dart';

class ResendCode extends StatelessWidget {
  final String email;

  const ResendCode({super.key, required this.email});

  void onResend(BuildContext context) {
    context.read<EmailVerificationCubit>().doIntent(
      ResendEmailVerificationRequestAction(email),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.DidNotReceiveTheCode.tr()),
            TextButton(
              onPressed: () {
                if (state.canResend) onResend(context);
              },
              child:
                  state.canResend
                      ? Text(
                        LocaleKeys.Resend.tr(),
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.pink,
                          fontSize: 14,
                        ),
                      )
                      : Text(
                        '${LocaleKeys.ResendIn.tr()} ${state.countdown}s',
                        style: const TextStyle(
                          color: AppColors.gray,
                          fontSize: 14,
                        ),
                      ),
            ),
          ],
        );
      },
    );
  }
}
