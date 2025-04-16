import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/routes/routes.dart';

@injectable
class RouteInitializer {
  final SharedPreferences sharedPreferences;

  RouteInitializer({required this.sharedPreferences});

  String? computeInitialRoute() {
    var isRememberMe = sharedPreferences.getBool('isRememberMe');
    if (isRememberMe != null && isRememberMe) {
      return AppRoutes.home;
    } else {
      return AppRoutes.loginRoute;
    }
  }
}
