import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets/app_colors.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
      child: Container(
        height: 48.h,
        color: AppColors.white,
        child: ElevatedButton(
          onPressed: () {
            // Add to cart action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pink,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
          ),
          child: Text("Add to Cart", style: TextStyle(fontSize: 16.sp)),
        ),
      ),
    );
  }
}
