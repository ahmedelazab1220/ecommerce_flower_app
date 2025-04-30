import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../domain/entity/notification_entity.dart';
import '../../view_model/notification_cubit.dart';
import '../../view_model/notification_state.dart';
import 'notification_item.dart';

class NotificationSlidableItem extends StatelessWidget {
  final NotificationEntity? notification;

  const NotificationSlidableItem({super.key, required this.notification});
  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<NotificationCubit>();
    return Skeletonizer(
      enabled: notification == null,
      child: Slidable(
        key: ValueKey(notification?.id),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          dragDismissible: false,
          children: [
            ValueListenableBuilder<int>(
              valueListenable: viewModel.counterNotifier,
              builder: (context, _, child) {
                if (notification!.id == null) return const SizedBox.shrink();
                final counter = viewModel.getCounter(notification!.id!);
                final isCountingDown = viewModel.isCountingDown(
                  notification!.id!,
                );

                return SlidableAction(
                  onPressed: (_) {
                    viewModel.doIntent(
                      CuttingProcessNotificationManager(notification!.id!),
                    );
                  },
                  autoClose: false,
                  backgroundColor:
                      isCountingDown ? AppColors.pink : AppColors.red,
                  foregroundColor: AppColors.white,
                  icon: isCountingDown ? Icons.undo_rounded : Icons.delete,
                  label: isCountingDown ? '$counter' : LocaleKeys.Delete.tr(),
                );
              },
            ),
          ],
        ),
        child: NotificationItem(
          title: notification?.title ?? LocaleKeys.NewOffer.tr(),
          message:
              notification?.body ??
              "${LocaleKeys.NewOffer.tr()} ${LocaleKeys.NewOffer.tr()}",
        ),
      ),
    );
  }
}
