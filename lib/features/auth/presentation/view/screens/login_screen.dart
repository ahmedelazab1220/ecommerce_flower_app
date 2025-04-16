import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/login_cubit.dart';
import '../widgets/login/do_not_have_account.dart';
import '../widgets/login/login_buttons.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/remember_me_and_forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final viewModel = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.Login.tr())),
        body: BlocListener<LoginCubit, LoginState>(
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
            if (state.baseState is BaseNavigationState) {
              final navState = state.baseState as BaseNavigationState;

              switch (navState.type) {
                case NavigationType.pop:
                  Navigator.pop(context);
                  break;
                case NavigationType.push:
                  Navigator.pushNamed(context, navState.routeName);
                  break;
                case NavigationType.pushReplacement:
                  Navigator.pushReplacementNamed(context, navState.routeName);
                  break;
              }
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    LoginForm(),
                    RememberMeAndForgotPassword(),
                    LoginButtons(),
                    DonotHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
