import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/register_screen.dart';
import 'package:ecommerce_flower_app/features/reset_password/presentation/view/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/main_layout/presentation/view/main_layout.dart';

class AppRoutes {
  AppRoutes._();
  static const String initialRoute = '/';
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPassword = "/forgetPassword";
  static const String home = "/home";
  static const String mainLayoutRoute = '/main-layout';
  static const String productDetailsRoute = '/product-details';
  static const String bestSellerRoute = '/best-seller';
  static const String categoriesRoute = '/categories';
  static const String occasionRoute = '/occasion';
  static const String resetPasswordRoute = '/change-password';

  static Map<String, Widget Function(BuildContext)> routes = {
    login: (context) => LoginScreen(),
    register: (context) => const RegisterScreen(),
    mainLayoutRoute: (context) => const MainLayout(),
    resetPasswordRoute: (context) => const ResetPasswordScreen(),
  };
}
