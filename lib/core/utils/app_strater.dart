import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'di/di.dart';

abstract class AppStrater {
  static Future<void> init() async {
    await ScreenUtil.ensureScreenSize();
    await Hive.initFlutter();
    await EasyLocalization.ensureInitialized();
    await configureDependencies();
  }
}
