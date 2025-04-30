import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';
import '../utils/routes/routes.dart';

@injectable
class RouteInitializer {
  final SharedPreferences sharedPreferences;

  RouteInitializer({required this.sharedPreferences});

  String? computeInitialRoute() {
    var isRememberMe = sharedPreferences.getBool(Constants.isRememberMe);
    if (isRememberMe != null && isRememberMe) {
      return AppRoutes.mainLayoutRoute;
    } else {
      return AppRoutes.loginRoute;
    }
  }
}
