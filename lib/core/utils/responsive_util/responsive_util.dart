import 'package:flutter/material.dart';

class ResponsiveUtil {
  ResponsiveUtil._();

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 500;
  }

  static bool isLargeMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 700;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 1080;
  }

  static bool isMobileHeight(BuildContext context) {
    return MediaQuery.of(context).size.height <= 600;
  }

  static bool isLargeMobileHeight(BuildContext context) {
    return MediaQuery.of(context).size.height <= 800;
  }

  static bool isTabletHeight(BuildContext context) {
    return MediaQuery.of(context).size.height < 1200;
  }

  static bool isTallAspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.aspectRatio < 0.75;
  }

  static bool isWideAspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.aspectRatio > 1.5;
  }

  static bool isStandardAspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.aspectRatio >= 0.75 &&
        MediaQuery.of(context).size.aspectRatio <= 1.5;
  }

  static double getResponsiveWidthValue(
    BuildContext context, {
    required double tablet,
    required double largeMobile,
    required double mobile,
  }) {
    var width = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return width * mobile;
    } else if (isLargeMobile(context)) {
      return width * largeMobile;
    } else {
      return width * tablet;
    }
  }

  static double getResponsiveHeightValue(
    BuildContext context, {
    required double tablet,
    required double largeMobile,
    required double mobile,
  }) {
    var height = MediaQuery.of(context).size.height;
    if (isMobileHeight(context)) {
      return height * mobile;
    } else if (isLargeMobileHeight(context)) {
      return height * largeMobile;
    } else {
      return height * tablet;
    }
  }

  static double getResponsiveAspectRatioValue(
    BuildContext context, {
    required double tallAspectRatio,
    required double standardAspectRatio,
    required double wideAspectRatio,
  }) {
    var aspectRatio = MediaQuery.of(context).size.aspectRatio;
    if (isWideAspectRatio(context)) {
      return aspectRatio * wideAspectRatio;
    } else if (isStandardAspectRatio(context)) {
      return aspectRatio * standardAspectRatio;
    } else {
      return aspectRatio * tallAspectRatio;
    }
  }
}
