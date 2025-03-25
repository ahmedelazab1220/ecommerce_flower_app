import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static const String register = '/register';

  static Map<String, Widget Function(dynamic)> routes = {
    register: (context) => const RegisterScreen(),
  };
}
