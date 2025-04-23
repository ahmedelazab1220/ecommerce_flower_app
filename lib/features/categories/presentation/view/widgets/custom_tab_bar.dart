import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category_entity.dart';
import '../../view_model/categories_cubit.dart';
import '../../view_model/categories_state.dart';
import 'custom_tab_bar_item.dart';

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
              return CustomTabBarItem(
                categoryName: categories[index].name,
                index: index,
                isSelected: isSelected,
              );
            },
          );
        },
      ),
    );
  }
}
