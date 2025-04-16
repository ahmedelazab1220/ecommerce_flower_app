import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'di/di.dart';

abstract class AppStrater {
  static Future<void> init() async {
    await Future.wait([
      ScreenUtil.ensureScreenSize(),
      Hive.initFlutter(),
      EasyLocalization.ensureInitialized(),
      configureDependencies(),
    ]);
  }
}
