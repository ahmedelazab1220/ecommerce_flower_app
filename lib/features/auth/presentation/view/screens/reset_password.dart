import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/widgets/header.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/reset_password_cubit.dart';
import '../widgets/reset_password_form.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final resetPasswordCubit = getIt<ResetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Password.tr())),
      body: BlocProvider(
        create: (context) => resetPasswordCubit,
        child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state.baseState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            } else if (state.baseState is BaseSuccessState) {
              // Logger().d('ResetPasswordSuccess -> ${email}');
              AppDialogs.hideLoading(context);
              // Navigate To Login
            } else if (state.baseState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: (state.baseState as BaseErrorState).errorMessage,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Header(
                  title: LocaleKeys.ResetPassword.tr(),
                  subtitle: LocaleKeys.PasswordRequirements.tr(),
                ),
                ResetPasswordForm(email: email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
