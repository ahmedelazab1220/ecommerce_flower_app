import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import '../../view_model/orders_cubit.dart';
import '../../view_model/orders_state.dart';

class CustomOrdersTabBar extends StatelessWidget {
  const CustomOrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    final tabs = cubit.tabLabels;
    final screenWidth = MediaQuery.of(context).size.width;
    final tabWidth = screenWidth / 2;
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final selectedIndex = state.selectedTabIndex;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = index == selectedIndex;
              return SizedBox(
                width: tabWidth,
                child: InkWell(
                  onTap: () {
                    if (!isSelected) cubit.doIntent(ChangeTabAction(index));
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color:
                              isSelected
                                  ? AppColors.pink
                                  : AppColors.white[AppColors.colorCode70],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 3,
                        width: double.infinity,
                        color:
                            isSelected
                                ? AppColors.pink
                                : AppColors.white[AppColors.colorCode70],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
