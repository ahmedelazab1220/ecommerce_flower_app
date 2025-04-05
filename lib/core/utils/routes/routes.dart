import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/main_layout/presentation/view/main_layout.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = '/';
  static const String mainLayoutRoute = '/main-layout';

  static const String register = '/register';

  static Map<String, Widget Function(BuildContext context)> routes = {
    mainLayoutRoute: (context) => const MainLayout(),
  
    register: (context) => const RegisterScreen(),
  };
}
