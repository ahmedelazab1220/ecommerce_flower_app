import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/email_verification_cubit.dart';

class ResendCode extends StatefulWidget {
  final String email;

  const ResendCode({super.key, required this.email});

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  bool canResend = true;
  int countdown = 0;
  Timer? _timer;

  void startCountdown() {
    setState(() {
      canResend = false;
      countdown = 30;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (countdown <= 0) {
          canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void onResend() {
    context.read<EmailVerificationCubit>().resendEmailVerification(
      widget.email,
    );
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.DidNotReceiveTheCode.tr()),
        TextButton(
          onPressed: canResend ? onResend : null,
          child:
              canResend
                  ? Text(
                    LocaleKeys.Resend.tr(),
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.pink,
                      fontSize: 14.sp,
                    ),
                  )
                  : Text(
                    'Resend in ${countdown}s',
                    style: TextStyle(color: AppColors.gray, fontSize: 14.sp),
                  ),
        ),
      ],
    );
  }
}
