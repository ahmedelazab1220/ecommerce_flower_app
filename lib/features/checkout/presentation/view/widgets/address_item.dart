import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/theme/app_theme.dart';

class AddressItem extends StatelessWidget {
  final index;
  const AddressItem({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio<int>(
                    value: index,
                    groupValue: 0,
                    activeColor: AppColors.pink,
                    fillColor: WidgetStateProperty.all(AppColors.pink),
                    onChanged: (value) {},
                  ),
                  Text(
                    'Home',
                    style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  '2XVP+XC - Sheikh Zayed',
                  style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
                    fontSize: 13,
                    color: AppColors.gray,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.editSvg, height: 24, width: 24),
          ),
        ],
      ),
    );
    ;
  }
}
