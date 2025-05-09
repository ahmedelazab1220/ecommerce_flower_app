import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';

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
            color: AppColors.gray.withAlpha(75),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => onChanged(index),
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
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.gray),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.editSvg),
            ),
          ),
        ],
      ),
    );
  }
}
