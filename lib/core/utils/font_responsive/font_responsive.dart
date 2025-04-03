import 'package:flutter/material.dart';

import '../size_config.dart';

class FontResponsive {
  FontResponsive._();

  static double getResponsiveFontSize({
    required BuildContext context,
    required double fontSize,
  }) {
    double scaleFactor = getScaleFactor(context: context);
    double fontResponsiveSize = fontSize * scaleFactor;
    // Clamp font size within limits (80% to 120% of calculated size)
    double lowerLimit = fontSize * 0.75;
    double upperLimit = fontSize * 1.3;
    // debugPrint("font size $fontResponsiveSize = $lowerLimit $upperLimit}");
    return fontResponsiveSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor({required BuildContext context}) {
    double width = MediaQuery.sizeOf(context).width;

    if (width <= SizeConfig.mobileSize) {
      return width / 500; // Small mobile scaling
    } else if (width <= SizeConfig.largeMobileSize) {
      return width / 650; // Large mobile scaling
    } else if (width <= SizeConfig.tabletSize) {
      return width / 950; // Tablet scaling
    } else {
      return width / 1200; // Larger screens
    }
  }
}
