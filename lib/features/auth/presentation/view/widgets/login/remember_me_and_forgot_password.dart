import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/app_colors.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (v) {},
                  activeColor: AppColors.pink,
                ),
                Text(
                  "Remember me",
                  style: TextStyle(color: Colors.black, fontSize: 13.sp),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forget Password?',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
