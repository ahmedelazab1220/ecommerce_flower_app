import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/reset_password_cubit.dart';
import '../../view_model/reset_password_state.dart';

class ResetPasswordForm extends StatelessWidget {
  final String email;

  const ResetPasswordForm({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: context.read<ResetPasswordCubit>().formKey,
          child: Column(
            children: [
              TextFormField(
                controller:
                    context.read<ResetPasswordCubit>().passwordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.NewPassword.tr(),
                  hintText: LocaleKeys.EnterYourNewPassword.tr(),
                ),
                validator:
                    (value) => context
                        .read<ResetPasswordCubit>()
                        .validator
                        .validatePassword(value ?? ''),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 24.h),
              TextFormField(
                controller:
                    context
                        .read<ResetPasswordCubit>()
                        .confirmPasswordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.ConfirmPassword.tr(),
                  hintText: LocaleKeys.ConfirmPassword.tr(),
                ),
                validator:
                    (value) => context
                        .read<ResetPasswordCubit>()
                        .validator
                        .validateConfirmPassword(
                          value!,
                          context
                              .read<ResetPasswordCubit>()
                              .passwordController
                              .text,
                        ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 48.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ResetPasswordCubit>().doIntent(
                      ResetPasswordRequestAction(email),
                    );
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
