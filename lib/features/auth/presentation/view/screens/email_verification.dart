import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/widgets/forget_password_header.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/email_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/email_verification_cubit.dart';
import '../widgets/resend_code.dart';
import '../widgets/verification_code_input.dart';

class EmailVerification extends StatelessWidget {
  EmailVerification({super.key});

  final emailVerificationCubit = getIt<EmailVerificationCubit>();

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Password.tr())),
      body: BlocProvider(
        create: (context) => emailVerificationCubit,
        child: BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
          listener: (context, state) {
            if (state is EmailVerificationLoading) {
              AppDialogs.showLoadingDialog(context);
            } else if (state is EmailVerificationSuccess) {
              AppDialogs.hideLoading(context);
              Navigator.of(
                context,
              ).pushNamed(AppRoutes.resetPassword, arguments: email);
            } else if (state is EmailVerificationFailure) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(context, message: state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ForgetPasswordHeader(
                    title: LocaleKeys.EmailVerification.tr(),
                    subtitle:
                        LocaleKeys
                            .PleaseEnterYourCodeThatSendToYourEmailAddress.tr(),
                  ),
                  VerificationCodeInput(state: state),
                  ResendCode(email: email),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
