import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/forget_password_cubit.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPasswordCubit>().formKey,
      child: Column(
        children: [
          TextFormField(
            controller: context.read<ForgetPasswordCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: LocaleKeys.Email.tr(),
              prefixIcon: const Icon(Icons.email),
            ),
            validator:
                (value) => context
                    .read<ForgetPasswordCubit>()
                    .validator
                    .validateEmail(value ?? ''),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 48.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {
                context.read<ForgetPasswordCubit>().forgetPassword();
              },
              child: Text(LocaleKeys.Confirm.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
