import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/theme/app_theme.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/email_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'dart:ui' as ui;

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/email_verification_cubit.dart';

class VerificationCodeInput extends StatelessWidget {
  final EmailVerificationState state;

  const VerificationCodeInput({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: ui.TextDirection.ltr,
          child: Pinput(
            keyboardType: TextInputType.number,
            controller: context.read<EmailVerificationCubit>().pinController,
            key: context.read<EmailVerificationCubit>().formKey,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            separatorBuilder: (index) => SizedBox(width: 4.w),
            length: 6,
            crossAxisAlignment: CrossAxisAlignment.center,
            onCompleted: (pin) {
              context.read<EmailVerificationCubit>().verifyResetCode();
            },
            forceErrorState: (state is EmailVerificationFailure),
            errorText:
                (state is EmailVerificationFailure)
                    ? LocaleKeys.InvalidCode.tr()
                    : null,
            defaultPinTheme: AppTheme.defaultPinTheme,
            errorPinTheme: AppTheme.errorPinTheme,
            errorBuilder: (errorText, pin) {
              return Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: AppColors.red,
                      size: 16.sp,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      errorText!,
                      style: TextStyle(color: AppColors.red, fontSize: 13.sp),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
