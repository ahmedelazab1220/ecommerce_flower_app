import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../view_model/notification_cubit.dart';
import '../../view_model/notification_state.dart';
import 'notification_slidable_item.dart';

class NotificationList extends StatelessWidget {
  final void Function(String notificationId) onDeletePressed;

  const NotificationList({super.key, required this.onDeletePressed});

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
          return Center(child: Text(""));
        }

        return ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return NotificationSlidableItem(
              notification: notification,
              onDeletePressed: onDeletePressed,
            );
          },
        );
      },
    );
  }
}
