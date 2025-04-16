import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../view_model/login_cubit.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: () {
              context.read<LoginCubit>().doIntent(LoginRequestAction());
            },
            child: Text(LocaleKeys.Login.tr()),
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          height: 48.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(10000),
          ),
          child: ElevatedButton(
            onPressed: () {
              context.read<LoginCubit>().doIntent(GuestRequestAction());
            },
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.all(AppColors.white),
              foregroundColor: WidgetStateProperty.all(AppColors.gray),
            ),
            child: Text(LocaleKeys.ContinueAsGuest.tr()),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
