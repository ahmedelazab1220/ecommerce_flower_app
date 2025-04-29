import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
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
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      ScreenUtil.ensureScreenSize(),
      Hive.initFlutter(),
      EasyLocalization.ensureInitialized(),
      configureDependencies(),
    ]);

    final sharedPreferences = getIt<SharedPreferences>();

    final langCode = selectedLanguageCode(sharedPreferences);
    startLocale = Locale(langCode);
  }

  static String selectedLanguageCode(SharedPreferences sharedPreferences) {
    return sharedPreferences.getString(Constants.selectedLanguageCode) ??
        Constants.en;
  }
}
