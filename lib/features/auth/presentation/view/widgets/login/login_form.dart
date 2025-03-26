import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../view_model/login_cubit.dart';

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
          validator: (value) => viewModel.validateEmail(value ?? ""),
          decoration: InputDecoration(
            labelText: LocaleKeys.Email.tr(),
            hintText: LocaleKeys.EnterYourEmail.tr(),
          ),
        ),
        SizedBox(height: 24.h),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: viewModel.passwordController,
          validator: (value) => viewModel.validatePassword(value ?? ""),
          obscureText: true,
          decoration: InputDecoration(
            labelText: LocaleKeys.Password.tr(),
            hintText: LocaleKeys.EnterYourPassword.tr(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
