import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/forget_password_cubit.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../widgets/forget_password_form.dart';
import '../widgets/header.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final ForgetPasswordCubit forgetPasswordCubit = getIt<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Password.tr())),
      body: BlocProvider(
        create: (context) => forgetPasswordCubit,
        child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state.baseState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            } else if (state.baseState is BaseSuccessState) {
              // Logger().d(
              //   'ForgetPasswordSuccess -> ${context.read<ForgetPasswordCubit>().emailController.text}',
              // );
              AppDialogs.hideLoading(context);
              Navigator.pushNamed(
                context,
                AppRoutes.emailVerification,
                arguments:
                    context.read<ForgetPasswordCubit>().emailController.text,
              );
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
                  title: LocaleKeys.ForgetPassword.tr(),
                  subtitle:
                      LocaleKeys
                          .PleaseEnterYourEmailAssociatedWithToYourAccount.tr(),
                ),
                const ForgetPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
