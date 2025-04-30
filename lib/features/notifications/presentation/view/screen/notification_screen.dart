import 'package:easy_localization/easy_localization.dart';

import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
import '../../view_model/notification_cubit.dart';
import '../../view_model/notification_state.dart';
import '../widgets/delete_confirmation_dialog.dart';
import '../widgets/notification_app_bar.dart';
import '../widgets/notification_list.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationCubit viewModel = getIt<NotificationCubit>();

  void _showDeleteConfirmation(
    BuildContext context,
    String notificationId,
  ) async {
    viewModel.startDeleteCountdown(notificationId);

    final result = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder:
          (dialogContext) => BlocProvider.value(
            value: viewModel,
            child: const DeleteConfirmationDialog(),
          ),
    );

    if (result == 'deleted') {
      AppDialogs.showSuccessDialog(
        context,
        message: LocaleKeys.TheNotificationDeletedSuccessfully.tr(),
        firstButtonText: LocaleKeys.Ok.tr(),
      );
    } else if (result == 'cancelled') {
      AppDialogs.showFailureDialog(
        context,
        message: LocaleKeys.NotificationDeletionCancelled.tr(),
        firstButtonText: LocaleKeys.Ok.tr(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel..doIntent(GetNotificationsAction()),
      child: Scaffold(
        appBar: const NotificationAppBar(),
        body: NotificationList(
          onDeletePressed: (notificationId) {
            _showDeleteConfirmation(context, notificationId);
          },
        ),
      ),
    );
  }
}
