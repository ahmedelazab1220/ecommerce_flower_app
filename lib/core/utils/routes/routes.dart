import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/forget_password_screen.dart';
import '../../../features/home_screen.dart';
import '../../../features/register_screen.dart';

import '../../../features/main_layout/presentation/view/main_layout.dart';

class AppRoutes {
  AppRoutes._();
  static const String initialRoute = '/';
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPassword = "/forgetPassword";
  static const String home = "/home";
  static const String mainLayoutRoute = '/main-layout';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomeScreen(),
    login: (context) => LoginScreen(),
    forgetPassword: (context) => const ForgetPasswordScreen(),
    register: (context) => const RegisterScreen(),
    mainLayoutRoute: (context) => const MainLayout(),
  };
}
