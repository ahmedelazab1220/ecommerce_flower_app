import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/register/register_cubit.dart';

class RegisterTextFieldSection extends StatelessWidget {
  const RegisterTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterCubit>();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                controller: viewModel.firstNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) => viewModel.validator.validateName(value ?? ""),
                decoration: InputDecoration(
                  labelText: LocaleKeys.FirstName.tr(),
                  hintText: LocaleKeys.EnterFirstName.tr(),
                  errorMaxLines: 2,
                ),
                onTapOutside:
                    (event) => FocusManager.instance.primaryFocus?.unfocus(),
              ),
            ),
            const SizedBox(width: 17),
            Expanded(
              child: TextFormField(
                controller: viewModel.lastNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) => viewModel.validator.validateName(value ?? ""),
                decoration: InputDecoration(
                  labelText: LocaleKeys.LastName.tr(),
                  hintText: LocaleKeys.EnterLastName.tr(),
                  errorMaxLines: 2,
                ),
                onTapOutside:
                    (event) => FocusManager.instance.primaryFocus?.unfocus(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: viewModel.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => viewModel.validator.validateEmail(value ?? ""),
          decoration: InputDecoration(
            labelText: LocaleKeys.Email.tr(),
            hintText: LocaleKeys.EnterYourEmail.tr(),
            errorMaxLines: 2,
          ),
          onTapOutside:
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                controller: viewModel.passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) =>
                        viewModel.validator.validatePassword(value ?? ""),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: LocaleKeys.Password.tr(),
                  hintText: LocaleKeys.EnterYourPassword.tr(),
                  errorMaxLines: 2,
                ),
                onTapOutside:
                    (event) => FocusManager.instance.primaryFocus?.unfocus(),
              ),
            ),
            const SizedBox(width: 17),
            Expanded(
              child: TextFormField(
                controller: viewModel.confirmPasswordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) => viewModel.validator.validateConfirmPassword(
                      value ?? "",
                      viewModel.passwordController.text,
                    ),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: LocaleKeys.ConfirmPassword.tr(),
                  hintText: LocaleKeys.ConfirmPassword.tr(),
                  errorMaxLines: 2,
                ),
                onTapOutside:
                    (event) => FocusManager.instance.primaryFocus?.unfocus(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: viewModel.phoneController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator:
              (value) => viewModel.validator.validatePhoneNumber(value ?? ""),
          decoration: InputDecoration(
            labelText: LocaleKeys.PhoneNumber.tr(),
            hintText: LocaleKeys.PhoneNumber.tr(),
            errorMaxLines: 2,
          ),
          onTapOutside:
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ],
    );
  }
}
