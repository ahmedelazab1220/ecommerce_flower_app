import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

class SharedHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const SharedHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
