import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes/routes.dart';

String? computeInitialRoute() {
  var isRememberMe = getIt<SharedPreferences>().getBool('isRememberMe');
  if (isRememberMe != null && isRememberMe) {
    return AppRoutes.home;
  } else {
    return AppRoutes.login;
  }
}
