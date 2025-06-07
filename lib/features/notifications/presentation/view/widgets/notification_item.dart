import 'package:ecommerce_flower_app/core/assets/app_icons.dart';
import 'package:ecommerce_flower_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../domain/entity/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;

  const NotificationItem({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.notificationDetailsRoute,
          arguments: {
            Constants.notificationEntity: NotificationEntity(
              title: title,
              body: message,
              id: "",
            ),
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(bottom: BorderSide(color: AppColors.lightGray)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppIcons.notificationSvg,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.gray,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.appTheme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.pink,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: AppTheme.appTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
