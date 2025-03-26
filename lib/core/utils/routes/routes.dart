import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/forget_password_screen.dart';
import '../../../features/home_screen.dart';
import '../../../features/register_screen.dart';

class AppRoutes {
  static const String home = "/home";
  static const String forgetPassword = "/forgetPassword";
  static const String login = "/login";
  static const String register = "/register";

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => HomeScreen(),
    login: (context) => LoginScreen(),
    forgetPassword: (context) => ForgetPasswordScreen(),
    register: (context) => RegisterScreen(),
  };
}
