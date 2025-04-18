import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'di/di.dart';

abstract class AppStrater {
  static Locale? startLocale;

  static Future<void> init() async {
    await Future.wait([
      ScreenUtil.ensureScreenSize(),
      Hive.initFlutter(),
      EasyLocalization.ensureInitialized(),
      configureDependencies(),
    ]);

    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('selected_language_code') ?? Constants.en;
    startLocale = Locale(langCode);
  }

  static Future<void> saveLocale(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language_code', langCode);
  }
}
