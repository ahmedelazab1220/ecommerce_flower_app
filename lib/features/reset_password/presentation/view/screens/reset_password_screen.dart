import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/reset_password/presentation/view/widgets/reset_password_form.dart';
import 'package:ecommerce_flower_app/features/reset_password/presentation/view_model/reset_password_cubit.dart';
import 'package:ecommerce_flower_app/features/reset_password/presentation/view_model/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final ResetPasswordCubit _cubit = getIt<ResetPasswordCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.ResetPassword.tr())),
        body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            final resetPasswordState = state.resetPasswordState;
            if (resetPasswordState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            } else if (resetPasswordState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            } else if (resetPasswordState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: resetPasswordState.errorMessage,
              );
            }
          },

          child: const ResetPasswordForm(),
        ),
      ),
    );
  }
}
