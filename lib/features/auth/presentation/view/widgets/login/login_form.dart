import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../view_model/login/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<LoginCubit>();
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: viewModel.emailController,
          validator: (value) => viewModel.validator.validateEmail(value ?? ""),
          decoration: InputDecoration(
            labelText: LocaleKeys.Email.tr(),
            hintText: LocaleKeys.EnterYourEmail.tr(),
          ),
          onTapOutside:
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
        ),
        const SizedBox(height: 24),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: viewModel.passwordController,
          validator:
              (value) => viewModel.validator.validatePassword(value ?? ""),
          obscureText: true,
          decoration: InputDecoration(
            labelText: LocaleKeys.Password.tr(),
            hintText: LocaleKeys.EnterYourPassword.tr(),
          ),
          onTapOutside:
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
