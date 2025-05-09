import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/widgets/shared_header_widget.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/email_verification/email_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/base/base_state.dart';
import '../../../../../../core/utils/di/di.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../view_model/email_verification/email_verification_cubit.dart';
import '../../widgets/email_verification/resend_code.dart';
import '../../widgets/email_verification/verification_code_input.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final EmailVerificationCubit viewModel = getIt<EmailVerificationCubit>();

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Password.tr())),
      body: BlocProvider(
        create: (context) => viewModel,
        child: BlocListener<EmailVerificationCubit, EmailVerificationState>(
          listener: (context, state) {
            if (state.baseState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            } else if (state.baseState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              Navigator.of(
                context,
              ).pushNamed(AppRoutes.resetPasswordRoute, arguments: email);
            } else if (state.baseState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: (state.baseState as BaseErrorState).errorMessage,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SharedHeaderWidget(
                  title: LocaleKeys.EmailVerification.tr(),
                  subtitle:
                      LocaleKeys
                          .PleaseEnterYourCodeThatSendToYourEmailAddress.tr(),
                ),
                const VerificationCodeInput(),
                ResendCode(email: email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
