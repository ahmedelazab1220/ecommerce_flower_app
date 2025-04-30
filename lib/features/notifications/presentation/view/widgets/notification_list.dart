import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_lotties.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/notification_cubit.dart';
import '../../view_model/notification_state.dart';
import 'notification_slidable_item.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NotificationCubit>();
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        final isLoading = state.getNotificationsState is BaseLoadingState;
        final notifications = viewModel.notifications;

        if (notifications!.isEmpty && !isLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AppLotties.emptyNotification),
                Text(
                  LocaleKeys.NoNotificationsFound.tr(),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.pink,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }

        return Skeletonizer(
          enabled: isLoading,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox.shrink(),
            itemCount: isLoading ? 5 : notifications.length,
            itemBuilder: (context, index) {
              return NotificationSlidableItem(
                notification: isLoading ? null : notifications[index],
              );
            },
          ),
        );
      },
    );
  }
}
