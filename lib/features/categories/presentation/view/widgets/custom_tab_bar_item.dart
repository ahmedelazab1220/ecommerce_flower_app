import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../view_model/categories_cubit.dart';
import '../../view_model/categories_state.dart';

class CustomTabBarItem extends StatelessWidget {
  const CustomTabBarItem({
    super.key,
    this.categoryName,
    required this.index,
    required this.isSelected,
  });

  final String? categoryName;
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CategoriesCubit>();
    return GestureDetector(
      onTap: () {
        if (viewModel.state.selectedTabIndex != index) {
          viewModel.doIntent(ChangeCategoryAction(index));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                categoryName ?? "",
                style: TextStyle(
                  color:
                      isSelected
                          ? AppColors.pink
                          : AppColors.white[AppColors.colorCode70],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                  color:
                      isSelected
                          ? AppColors.pink
                          : AppColors.white[AppColors.colorCode70],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
