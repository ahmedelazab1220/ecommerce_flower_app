import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/notification_cubit.dart';
import '../../view_model/notification_state.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NotificationCubit>();
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (dialogContext, state) {
        final seconds = state.countdownSeconds;

        if (seconds == 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(dialogContext).pop('deleted');
          });
          return const SizedBox.shrink();
        }

        return AlertDialog(
          title: Text(
            LocaleKeys.AreYouSureYouWantToDeleteThisNotification.tr(),
          ),
          content: Text(
            "${LocaleKeys.TheNotificationWillBeDeletedAfter.tr()} $seconds ${LocaleKeys.Seconds.tr()}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                viewModel.cancelDeleteCountdown();
                Navigator.of(dialogContext).pop('cancelled');
              },
              child: Text(LocaleKeys.Cancel.tr()),
            ),
          ],
        );
      },
    );
  }
}
