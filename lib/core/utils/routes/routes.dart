import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/main_layout/presentation/view/main_layout.dart';

class AppRoutes {
  AppRoutes._();
  static const String initialRoute = '/';
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String home = "/home";
  static const String mainLayoutRoute = '/main-layout';
  static const String productDetailsRoute = '/product-details';
  static const String bestSellerRoute = '/best-seller';
  static const String categoriesRoute = '/categories';
  static const String occasionRoute = '/occasion';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginRoute: (context) => const LoginScreen(),
    mainLayoutRoute: (context) => const MainLayout(),
  };
}
