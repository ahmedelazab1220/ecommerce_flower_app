import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/usecase/login_use_case.dart';
import '../widgets/login/do_not_have_account.dart';
import '../widgets/login/login_buttons.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/remember_me_and_forgot_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useCase = getIt<LoginUseCase>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LoginForm(),
            RememberMeAndForgotPassword(),
            LoginButtons(),
            DonotHaveAccount(),
          ],
        ),
      ),
    );
  }
}
