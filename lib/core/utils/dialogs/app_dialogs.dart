import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../assets/app_colors.dart';
import '../../assets/app_lotties.dart';
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
  static Future<void> showSuccessDialog(
    BuildContext context, {
    required String message,
    String? description,
    String? firstButtonText,
    String? secondButtonText,
    VoidCallback? firstButtonAction,
    VoidCallback? secondButtonAction,
  }) async {
    var size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: AppColors.lightPink,
            icon: Lottie.asset(
              AppLotties.check,
              height: size.aspectRatio * 350,
              fit: BoxFit.scaleDown,
            ),
            titleTextStyle: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            titlePadding: const EdgeInsets.symmetric(horizontal: 5.0),
            content:
                description != null
                    ? Text(
                      description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )
                    : null,
            contentPadding: const EdgeInsets.only(
              left: 55,
              right: 55,
              top: 20,
              bottom: 35,
            ),
            contentTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.black[AppColors.colorCode40],
              fontWeight: FontWeight.w500,
            ),
            actions: [
              Row(
                spacing: 8.0,
                children: [
                  if (secondButtonText != null)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightPink,
                          side: const BorderSide(color: AppColors.pink),
                        ),
                        onPressed:
                            secondButtonAction ??
                            () {
                              Navigator.pop(context);
                            },
                        child: Text(
                          secondButtonText,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.pink),
                        ),
                      ),
                    ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.pink,
                      ),
                      onPressed:
                          firstButtonAction ??
                          () {
                            Navigator.pop(context);
                          },
                      child: Text(
                        LocaleKeys.Ok.tr(),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            title: Text(message),
          ),
    );
  }

  // Hide the loading dialog
  static void hideLoading(BuildContext context) => Navigator.of(context).pop();

  // Show a failure dialog
  static Future<void> showFailureDialog(
    BuildContext context, {
    required String message,
    String? description,
    String? firstButtonText,
    String? secondButtonText,
    VoidCallback? firstButtonAction,
    VoidCallback? secondButtonAction,
  }) async {
    var size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: AppColors.lightPink,
            icon: Lottie.asset(
              AppLotties.error,
              height: size.aspectRatio * 350,
              fit: BoxFit.scaleDown,
            ),
            titleTextStyle: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            titlePadding: const EdgeInsets.symmetric(horizontal: 5.0),
            content:
                description != null
                    ? Text(
                      description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )
                    : null,
            contentPadding: const EdgeInsets.only(
              left: 55,
              right: 55,
              top: 20,
              bottom: 35,
            ),
            contentTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.black[AppColors.colorCode40],
              fontWeight: FontWeight.w500,
            ),
            actions: [
              Row(
                spacing: 8.0,
                children: [
                  if (secondButtonText != null)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightPink,
                          side: const BorderSide(color: AppColors.pink),
                        ),
                        onPressed:
                            secondButtonAction ??
                            () {
                              Navigator.pop(context);
                            },
                        child: Text(
                          secondButtonText,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.pink),
                        ),
                      ),
                    ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.pink,
                      ),
                      onPressed:
                          firstButtonAction ??
                          () {
                            Navigator.pop(context);
                          },
                      child: Text(
                        LocaleKeys.Ok.tr(),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            title: Text(message),
          ),
    );
  }
}
