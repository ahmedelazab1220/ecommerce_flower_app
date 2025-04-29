import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/notifications/domain/entity/notifications_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import 'notification_item.dart';

class NotificationSlidableItem extends StatelessWidget {
  final NotificationsEntity notification;
  final void Function(String notificationId) onDeletePressed;

  const NotificationSlidableItem({
    super.key,
    required this.notification,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(notification.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (_) => onDeletePressed(notification.id ?? ''),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: LocaleKeys.Delete.tr(),
          ),
        ],
      ),
      child: NotificationItem(
        title: notification.title ?? '',
        message: notification.body ?? '',
      ),
    );
  }
}
