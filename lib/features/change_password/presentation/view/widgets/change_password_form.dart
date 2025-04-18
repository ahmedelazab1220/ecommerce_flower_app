import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/change_password_cubit.dart';
import '../../view_model/change_password_state.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordCubit changePasswordCubit =
        context.read<ChangePasswordCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Form(
            key: changePasswordCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: changePasswordCubit.currentPasswordController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.CurrentPassword.tr(),
                    hintText: LocaleKeys.CurrentPassword.tr(),
                  ),
                  validator:
                      (value) => changePasswordCubit.validator.validatePassword(
                        value ?? '',
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  onChanged:
                      (value) =>
                          changePasswordCubit.doIntent(FormChangedAction()),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: changePasswordCubit.newPasswordController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.NewPassword.tr(),
                    hintText: LocaleKeys.NewPassword.tr(),
                  ),
                  validator:
                      (value) => changePasswordCubit.validator.validatePassword(
                        value!,
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,

                  onChanged:
                      (value) =>
                          changePasswordCubit.doIntent(FormChangedAction()),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: changePasswordCubit.confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.ConfirmPassword.tr(),
                    hintText: LocaleKeys.ConfirmPassword.tr(),
                  ),
                  validator:
                      (value) =>
                          changePasswordCubit.validator.validateConfirmPassword(
                            value!,
                            changePasswordCubit.newPasswordController.text,
                          ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  onChanged:
                      (value) =>
                          changePasswordCubit.doIntent(FormChangedAction()),
                ),
                const SizedBox(height: 48),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor:
                            AppColors.black[AppColors.colorCode30],
                      ),
                      onPressed:
                          state.isFormValid
                              ? () => changePasswordCubit.doIntent(
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
