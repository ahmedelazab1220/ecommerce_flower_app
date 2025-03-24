import 'package:flutter/material.dart';

import '../../../../../../core/assets/app_colors.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.pink,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.pink,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
