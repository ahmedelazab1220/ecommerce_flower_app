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
    final viewModel = context.read<ChangePasswordCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Form(
            onChanged: () => viewModel.doIntent(FormChangedAction()),
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: viewModel.currentPasswordController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.CurrentPassword.tr(),
                    hintText: LocaleKeys.CurrentPassword.tr(),
                  ),
                  validator:
                      (value) =>
                          viewModel.validator.validatePassword(value ?? ''),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  onTapUpOutside:
                      (event) => FocusManager.instance.primaryFocus?.unfocus(),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: viewModel.newPasswordController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.NewPassword.tr(),
                    hintText: LocaleKeys.NewPassword.tr(),
                  ),
                  validator:
                      (value) => viewModel.validator.validatePassword(value!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  onTapUpOutside:
                      (event) => FocusManager.instance.primaryFocus?.unfocus(),
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
                        viewModel.newPasswordController.text,
                      ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
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
                              ? () => viewModel.doIntent(ButtonPressedAction())
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
