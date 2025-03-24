import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/app_colors.dart';

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
            onPressed: () {},
            child: const Text("Login"),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: double.infinity,
          height: 48.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(10000),
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStateProperty.all(AppColors.white),
                  foregroundColor: WidgetStateProperty.all(AppColors.gray),
                ),
            child: const Text("Continue as guest"),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
