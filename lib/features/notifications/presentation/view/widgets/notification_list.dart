import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
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
        final notifications = isLoading ? [] : (viewModel.notifications ?? []);

        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (notifications.isEmpty) {
          return const Center(child: Text(""));
        }

        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox.shrink(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return NotificationSlidableItem(notification: notification);
          },
        );
      },
    );
  }
}
