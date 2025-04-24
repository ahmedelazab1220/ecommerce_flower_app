import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/change_password_cubit.dart';
import '../../view_model/change_password_state.dart';
import '../widgets/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangePasswordCubit _cubit = getIt<ChangePasswordCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.ResetPassword.tr())),
        body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            final changePasswordState = state.changePasswordState;
            if (changePasswordState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            } else if (changePasswordState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
            } else if (changePasswordState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: changePasswordState.errorMessage,
              );
            }
          },

          child: const ChangePasswordForm(),
        ),
      ),
    );
  }
}
