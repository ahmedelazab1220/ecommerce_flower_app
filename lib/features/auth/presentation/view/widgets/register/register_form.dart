import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/register/register_cubit.dart';
import '../../../view_model/register/register_state.dart';
import 'register_radio_buttons.dart';
import 'register_text_field_section.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterCubit>();
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const RegisterTextFieldSection(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.Gender.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: RegisterRadioTile(
                        labelKey: LocaleKeys.Female.tr(),
                        value: LocaleKeys.Female.tr(),
                      ),
                    ),
                    Expanded(
                      child: RegisterRadioTile(
                        labelKey: LocaleKeys.Male.tr(),
                        value: LocaleKeys.Male.tr(),
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "${LocaleKeys.CreatingAnAccountYouAgreeToOur.tr()} ",
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: LocaleKeys.TermsAndConditions.tr(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  viewModel.doIntent(UserRegistrationAction());
                },
                child: Text(LocaleKeys.Signup.tr()),
              ),
              const SizedBox(height: 16),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: LocaleKeys.AlreadyHaveAnAccount.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: " ${LocaleKeys.Login.tr()}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.pink,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.pink,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              viewModel.doIntent(
                                NavigationAction(
                                  routeName: AppRoutes.loginRoute,
                                  type: NavigationType.pushReplacement,
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
