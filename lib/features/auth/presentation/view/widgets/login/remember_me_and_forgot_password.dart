import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/routes/routes.dart';
import '../../../view_model/login_cubit.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel = context.read<LoginCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen:
                      (previous, current) =>
                          previous.isRememberMe != current.isRememberMe,
                  builder: (context, state) {
                    return Checkbox(
                      value: loginViewModel.isRememberMe,
                      onChanged: (value) {
                        loginViewModel.rememberMe(value!);
                      },
                      activeColor: AppColors.pink,
                    );
                  },
                ),
                Text(
                  LocaleKeys.RememberMe.tr(),
                  style: TextStyle(color: Colors.black, fontSize: 13.sp),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.forgetPassword);
              },
              child: Text(
                LocaleKeys.Forget_Password.tr(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.black,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
