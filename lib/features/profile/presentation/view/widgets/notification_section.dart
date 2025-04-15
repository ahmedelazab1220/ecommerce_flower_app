import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_state.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  buildWhen:
                      (previous, current) =>
                          previous.isNotification != current.isNotification,
                  builder: (context, state) {
                    return FlutterSwitch(
                      value: viewModel.isNotification,
                      onToggle: (value) {
                        viewModel.notification(value);
                      },
                      width: 42.spMax,
                      height: 20.spMax,
                      borderRadius: 30.spMax,
                      padding: 1.spMax,
                      toggleColor: AppColors.white,
                      activeColor: AppColors.pink,
                      inactiveColor: AppColors.black.withValues(alpha: 0.1),
                    );
                  },
                ),
                const SizedBox(width: 6),
                Text(
                  LocaleKeys.Notification.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppIcons.backSvg,
                height: 24.spMax,
                width: 24.spMax,
              ),
              onPressed: () {
                // Handle settings button press
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 1, color: AppColors.lightGray),
      ],
    );
  }
}
