import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/forget_password_cubit.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../widgets/forget_password_form.dart';
import '../widgets/forget_password_header.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final ForgetPasswordCubit forgetPasswordCubit = getIt<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Password.tr())),
      body: BlocProvider(
        create: (context) => forgetPasswordCubit,
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordLoading) {
              AppDialogs.showLoadingDialog(context);
            } else if (state is ForgetPasswordSuccess) {
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
            } else if (state is ForgetPasswordFailure) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(context, message: state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16).w,
              child: Column(
                children: [
                  ForgetPasswordHeader(
                    title: LocaleKeys.ForgetPassword.tr(),
                    subtitle:
                        LocaleKeys
                            .PleaseEnterYourEmailAssociatedWithToYourAccount.tr(),
                  ),
                  const ForgetPasswordForm(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
