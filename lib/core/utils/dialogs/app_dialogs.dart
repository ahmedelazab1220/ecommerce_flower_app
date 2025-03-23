import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../l10n/locale_keys.g.dart';

class AppDialogs {
  // Private constructor to prevent instantiation
  AppDialogs._();

  // Show a loading dialog
  static void showLoadingDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(message ?? LocaleKeys.Loading.tr()),
            ],
          ),
        );
      },
    );
  }

  // Show a success dialog
  static void showSuccessDialog(
    BuildContext context, {
    required String message,
    String? buttonText,
    String? nextActionTitle,
    VoidCallback? nextAction,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [const SizedBox(height: 16), Text(message)],
          ),
          actions: [
            if (nextActionTitle != null)
              TextButton(onPressed: nextAction, child: Text(nextActionTitle)),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText ?? LocaleKeys.Ok.tr()),
            ),
          ],
        );
      },
    );
  }

  // Hide the loading dialog
  static void hideLoading(BuildContext context) => Navigator.of(context).pop();

  // Show a failure dialog
  static void showFailureDialog(
    BuildContext context, {
    required String message,
    String? buttonText,
    VoidCallback? nextAction,
    String? nextActionTitle,
    String? title,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? LocaleKeys.Error.tr()),
          content: Text(message),
          actions: [
            if (nextAction != null && nextActionTitle != null)
              TextButton(onPressed: nextAction, child: Text(nextActionTitle)),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText ?? LocaleKeys.Ok.tr()),
            ),
          ],
        );
      },
    );
  }
}
