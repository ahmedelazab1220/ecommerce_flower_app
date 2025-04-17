import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
        BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen:
              (previous, current) =>
                  previous.isNotification != current.isNotification,
          builder: (context, state) {
            return ListTile(
              visualDensity: const VisualDensity(vertical: -2),
              onTap: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              contentPadding: EdgeInsets.zero,
              leading: Switch(
                value: viewModel.isNotification,
                onChanged: (value) {
                  viewModel.notification(value);
                },
                activeColor: AppColors.pink,
                activeTrackColor: AppColors.pink[AppColors.colorCode40],
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.black.withValues(alpha: 0.1),
                padding: const EdgeInsets.all(1.0),
                trackOutlineColor: WidgetStateProperty.all(
                  AppColors.pink.withAlpha(1),
                ),
              ),
              title: Text(
                LocaleKeys.Notification.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: SvgPicture.asset(AppIcons.backSvg),
            );
          },
        ),
        const SizedBox(height: 2),
        const Divider(thickness: 1, color: AppColors.lightGray),
      ],
    );
  }
}
