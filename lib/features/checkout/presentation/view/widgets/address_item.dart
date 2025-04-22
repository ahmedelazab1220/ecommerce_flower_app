import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/theme/app_theme.dart';

class AddressItem extends StatelessWidget {
  final int index;
  final int groupValue;
  final String title;
  final String subtitle;
  final ValueChanged<int?> onChanged;

  const AddressItem({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withAlpha((0.2 * 255).toInt()),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Radio<int>(
            value: index,
            groupValue: groupValue,
            activeColor: AppColors.pink,
            fillColor: WidgetStateProperty.all(AppColors.pink),
            onChanged: onChanged,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
                    fontSize: 13,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.editSvg, height: 24, width: 24),
          ),
        ],
      ),
    );
  }
}
