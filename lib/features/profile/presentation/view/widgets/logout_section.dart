import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_state.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileCubit>();
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.logoutState is BaseLoadingState) {
          AppDialogs.showLoadingDialog(context);
        }
        if (state.logoutState is BaseSuccessState) {
          AppDialogs.hideLoading(context);
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
        if (state.logoutState is BaseErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailureDialog(
            context,
            message: (state.baseState as BaseErrorState).errorMessage,
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppIcons.logoutSvg,
                      height: 19.spMax,
                      width: 19.spMax,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      LocaleKeys.Logout.tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    AppIcons.logoutSvg,
                    height: 24.spMax,
                    width: 24.spMax,
                  ),
                  onPressed: () {
                    viewModel.doIntent(LogoutRequestAction());
                  },
                ),
              ],
            ),
            onTap: () {
              viewModel.doIntent(LogoutRequestAction());
            },
          ),
        ],
      ),
    );
  }
}
