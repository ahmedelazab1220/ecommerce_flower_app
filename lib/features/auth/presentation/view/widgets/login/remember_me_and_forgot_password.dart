import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/routes/routes.dart';
import '../../../view_model/login/login_cubit.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<LoginCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen:
                  (previous, current) =>
                      previous.isRememberMe != current.isRememberMe,
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    viewModel.rememberMe(!viewModel.isRememberMe);
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: viewModel.isRememberMe,
                        onChanged: (value) {
                          viewModel.rememberMe(value!);
                        },
                        activeColor: AppColors.pink,
                      ),
                      Text(
                        LocaleKeys.RememberMe.tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                viewModel.doIntent(
                  NavigationAction(
                    routeName: AppRoutes.forgetPasswordRoute,
                    type: NavigationType.push,
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.black,
                padding: EdgeInsets.zero,
              ),
              child: Text(LocaleKeys.ForgetPassword.tr()),
            ),
          ],
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
