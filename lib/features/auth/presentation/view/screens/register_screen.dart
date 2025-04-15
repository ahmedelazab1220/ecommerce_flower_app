import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/widgets/register/register_form.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(LocaleKeys.Signup.tr())),
      body: BlocProvider(
        create: (context) => getIt<RegisterCubit>(),
        child: BlocListener<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            final registerState = state.registerState;
            if (registerState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            } else if (registerState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            } else if (registerState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: registerState.errorMessage,
              );
            }
          },
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
