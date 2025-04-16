import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/register/register_cubit.dart';
import '../../view_model/register/register_state.dart';
import '../widgets/register/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final viewModel = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(LocaleKeys.Signup.tr())),
      body: BlocProvider(
        create: (context) => viewModel,
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.registerState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            }
            if (state.registerState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
            }
            if (state.registerState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: (state as BaseErrorState).errorMessage,
              );
            }
            if (state.registerState is BaseNavigationState) {
              final navState = state.registerState as BaseNavigationState;

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
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
