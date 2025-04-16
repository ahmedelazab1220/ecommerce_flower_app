import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../widgets/login/do_not_have_account.dart';
import '../widgets/login/login_buttons.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/remember_me_and_forgot_password.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginViewModel = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Login.tr())),
      body: BlocProvider(
        create: (context) => loginViewModel,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.baseState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            }
            if (state.baseState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.mainLayoutRoute,
              );
            }
            if (state.baseState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: (state.baseState as BaseErrorState).errorMessage,
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: context.read<LoginCubit>().formKey,
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LoginForm(),
                      RememberMeAndForgotPassword(),
                      LoginButtons(),
                      DonotHaveAccount(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
