import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../../core/utils/routes/routes.dart';
import '../../../view_model/login/login_cubit.dart';
import 'remember_me_and_forgot_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<LoginCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        const RememberMeAndForgotPassword(),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () {
            viewModel.doIntent(LoginRequestAction());
          },
          child: Text(LocaleKeys.Login.tr()),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            viewModel.doIntent(GuestRequestAction());
            Navigator.pushReplacementNamed(context, AppRoutes.mainLayoutRoute);
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.white,
            side: BorderSide(color: AppColors.white[AppColors.colorCode90]!),
          ),
          child: Text(
            LocaleKeys.ContinueAsGuest.tr(),
            style: TextStyle(color: AppColors.white[AppColors.colorCode90]!),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(text: '${LocaleKeys.DonotHaveAnAccount.tr()} '),
                  TextSpan(
                    text: LocaleKeys.Signup.tr(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.pink,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.pink,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.registerRoute,
                            );
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
