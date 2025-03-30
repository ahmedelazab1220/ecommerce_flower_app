import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/forget_password_cubit.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordCubit forgetPasswordCubit =
        context.read<ForgetPasswordCubit>();
    return Form(
      key: forgetPasswordCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: forgetPasswordCubit.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: LocaleKeys.Email.tr(),
              prefixIcon: const Icon(Icons.email),
            ),
            validator:
                (value) =>
                    forgetPasswordCubit.validator.validateEmail(value ?? ''),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 48),
          SizedBox(
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {
                forgetPasswordCubit.doIntent(ForgetPasswordRequestAction());
              },
              child: Text(LocaleKeys.Confirm.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
