import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterTextFieldSection extends StatelessWidget {
  const RegisterTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return Column(
      children: [
        /// First Name & Last Name
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                controller: registerCubit.firstNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) =>
                        registerCubit.validator.validateName(value ?? ""),
                decoration: InputDecoration(
                  labelText: LocaleKeys.FirstName.tr(),
                  hintText: LocaleKeys.EnterFirstName.tr(),
                  errorMaxLines: 2,
                ),
              ),
            ),
            SizedBox(width: 17.w),
            Expanded(
              child: TextFormField(
                controller: registerCubit.lastNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) =>
                        registerCubit.validator.validateName(value ?? ""),
                decoration: InputDecoration(
                  labelText: LocaleKeys.LastName.tr(),
                  hintText: LocaleKeys.EnterLastName.tr(),
                  errorMaxLines: 2,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),

        /// Email
        TextFormField(
          controller: registerCubit.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator:
              (value) => registerCubit.validator.validateEmail(value ?? ""),
          decoration: InputDecoration(
            labelText: LocaleKeys.Email.tr(),
            hintText: LocaleKeys.EnterYourEmail.tr(),
            errorMaxLines: 2,
          ),
        ),
        SizedBox(height: 24.h),

        /// Password & Confirm Password
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              child: TextFormField(
                controller: registerCubit.passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) =>
                        registerCubit.validator.validatePassword(value ?? ""),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: LocaleKeys.Password.tr(),
                  hintText: LocaleKeys.EnterYourPassword.tr(),
                  errorMaxLines: 2,
                ),
              ),
            ),
            SizedBox(width: 17.w),
            Expanded(
              child: TextFormField(
                controller: registerCubit.confirmPasswordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    (value) => registerCubit.validator.validateConfirmPassword(
                      value ?? "",
                      registerCubit.passwordController.text,
                    ),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: LocaleKeys.ConfirmPassword.tr(),
                  hintText: LocaleKeys.ConfirmPassword.tr(),
                  errorMaxLines: 2,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),

        /// Phone Number
        TextFormField(
          controller: registerCubit.phoneController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator:
              (value) =>
                  registerCubit.validator.validatePhoneNumber(value ?? ""),
          decoration: InputDecoration(
            labelText: LocaleKeys.PhoneNumber.tr(),
            hintText: LocaleKeys.PhoneNumber.tr(),
            errorMaxLines: 2,
          ),
        ),
      ],
    );
  }
}
