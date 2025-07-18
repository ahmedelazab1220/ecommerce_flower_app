import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/email_verification/email_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'dart:ui' as ui;

import '../../../../../../core/base/base_state.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../view_model/email_verification/email_verification_cubit.dart';

class VerificationCodeInput extends StatelessWidget {
  const VerificationCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailVerificationCubit viewModel =
        context.read<EmailVerificationCubit>();

    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      builder: (context, state) {
        return Column(
          children: [
            Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Pinput(
                keyboardType: TextInputType.number,
                controller: viewModel.pinController,
                key: viewModel.formKey,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                separatorBuilder: (index) => const SizedBox(width: 4),
                length: 6,
                crossAxisAlignment: CrossAxisAlignment.center,
                onCompleted: (pin) {
                  viewModel.doIntent(EmailVerificationRequestAction());
                },
                forceErrorState: (state.baseState is BaseErrorState),
                errorText: LocaleKeys.InvalidCode.tr(),
                defaultPinTheme: PinTheme(
                  width: 74,
                  height: 68,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white[AppColors.colorCode60],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                errorPinTheme: PinTheme(
                  width: 74,
                  height: 68,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                errorBuilder: (errorText, pin) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.error_outline, color: AppColors.red),
                        const SizedBox(width: 4),
                        Text(
                          errorText!,
                          style: const TextStyle(color: AppColors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
