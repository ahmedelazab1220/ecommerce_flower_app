import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../view_model/reset_password/reset_password_cubit.dart';
import '../../../view_model/reset_password/reset_password_state.dart';

class ResetPasswordForm extends StatelessWidget {
  final String email;
  final String emptyString = "";

  const ResetPasswordForm({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordCubit viewModel = context.read<ResetPasswordCubit>();
    return Column(
      children: [
        Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: viewModel.passwordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.NewPassword.tr(),
                  hintText: LocaleKeys.EnterYourNewPassword.tr(),
                ),
                validator:
                    (value) => viewModel.validator.validatePassword(
                      value ?? emptyString,
                    ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: viewModel.confirmPasswordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.ConfirmPassword.tr(),
                  hintText: LocaleKeys.ConfirmPassword.tr(),
                ),
                validator:
                    (value) => viewModel.validator.validateConfirmPassword(
                      value!,
                      viewModel.passwordController.text,
                    ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 48),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (viewModel.formKey.currentState?.validate() ?? false) {
                      viewModel.doIntent(ResetPasswordRequestAction(email));
                    }
                  },
                  child: Text(LocaleKeys.Confirm.tr()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
