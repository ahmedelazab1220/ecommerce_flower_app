import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/reset_password_cubit.dart';
import '../../view_model/reset_password_state.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordCubit resetPasswordCubit =
        context.read<ResetPasswordCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Form(
            key: resetPasswordCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: resetPasswordCubit.currentPasswordController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.CurrentPassword.tr(),
                    hintText: LocaleKeys.CurrentPassword.tr(),
                  ),
                  validator:
                      (value) => resetPasswordCubit.validator.validatePassword(
                        value ?? '',
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  onChanged:
                      (value) =>
                          resetPasswordCubit.doIntent(FormChangedAction()),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: resetPasswordCubit.newPasswordController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.NewPassword.tr(),
                    hintText: LocaleKeys.NewPassword.tr(),
                  ),
                  validator:
                      (value) =>
                          resetPasswordCubit.validator.validatePassword(value!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,

                  onChanged:
                      (value) =>
                          resetPasswordCubit.doIntent(FormChangedAction()),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: resetPasswordCubit.confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.ConfirmPassword.tr(),
                    hintText: LocaleKeys.ConfirmPassword.tr(),
                  ),
                  validator:
                      (value) =>
                          resetPasswordCubit.validator.validateConfirmPassword(
                            value!,
                            resetPasswordCubit.newPasswordController.text,
                          ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  onChanged:
                      (value) =>
                          resetPasswordCubit.doIntent(FormChangedAction()),
                ),
                const SizedBox(height: 48),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor:
                            AppColors.black[AppColors.colorCode30],
                      ),
                      onPressed:
                          state.isFormValid
                              ? () => resetPasswordCubit.doIntent(
                                ButtonPressedAction(),
                              )
                              : null,
                      child: Text(LocaleKeys.Update.tr()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
