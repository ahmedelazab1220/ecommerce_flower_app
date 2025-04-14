import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_cubit.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBar extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CustomTabBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          final selectedTab = state.selectedTabIndex;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = selectedTab == index;
              return _buildCategoryItem(context, index, isSelected);
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index, bool isSelected) {
    final cubit = context.read<CategoriesCubit>();
    final categoryName = categories[index].name ?? "";

    return GestureDetector(
      onTap: () {
        if (cubit.state.selectedTabIndex != index) {
          cubit.doIntent(ChangeCategoryAction(index));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                categoryName,
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
