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
    double lowerLimit = fontSize * 0.7;
    double upperLimit = fontSize * 1.2;
    // debugPrint("font size $fontResponsiveSize = $lowerLimit $upperLimit}");
    return fontResponsiveSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor({required BuildContext context}) {
    // var dispatcher =PlatformDispatcher.instance;
    // var physicalWidth =dispatcher.views.first.physicalSize.width;
    // var devicePixelRatio =dispatcher.views.first.devicePixelRatio;
    //
    //   double width = physicalWidth / devicePixelRatio;
    double width = MediaQuery.sizeOf(context).width;
    if (width <= 400) {
      return width / 500; // Tighter scaling for small phones
    } else if (width <= SizeConfig.mobileSize) {
      return width / 700;
    } else if (width <= SizeConfig.tabletSize) {
      return width / 1200;
    } else {
      return width / 1800; // Slightly larger screens have larger base
    }
  }
}
