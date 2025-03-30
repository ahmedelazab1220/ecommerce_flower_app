import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/email_verification.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/screens/reset_password.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/presentation/view/screens/forget_password.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String forgetPassword = '/forget-password';
  static const String resetPassword = '/reset-password';
  static const String emailVerification = '/email-verification';

  static Map<String, Widget Function(dynamic)> routes = {
    forgetPassword: (context) => ForgetPassword(),
    resetPassword: (context) => ResetPassword(),
    emailVerification: (context) => EmailVerification(),
  };
}
