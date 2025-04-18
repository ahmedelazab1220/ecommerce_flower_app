import 'package:flutter/material.dart';

import '../../assets/app_colors.dart';

class DefaultAvatarWidget {
  DefaultAvatarWidget._();

  static Widget build() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white[AppColors.colorCode40]!,
            AppColors.black[AppColors.colorCode70]!,
          ],
        ),
      ),
      child: const Center(
        child: Icon(Icons.person, size: 40, color: AppColors.white),
      ),
    );
  }
}
