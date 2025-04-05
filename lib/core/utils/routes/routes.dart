import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/email_verification.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/reset_password.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/presentation/view/screens/forget_password.dart';

import '../../../features/main_layout/presentation/view/main_layout.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = '/';
  static const String mainLayoutRoute = '/main-layout';
  static const String forgetPassword = '/forget-password';
  static const String resetPassword = '/reset-password';
  static const String emailVerification = '/email-verification';

  static Map<String, Widget Function(BuildContext context)> routes = {
    mainLayoutRoute: (context) => const MainLayout(),
    forgetPassword: (context) => ForgetPassword(),
    resetPassword: (context) => ResetPassword(),
    emailVerification: (context) => EmailVerification(),
  };
}
