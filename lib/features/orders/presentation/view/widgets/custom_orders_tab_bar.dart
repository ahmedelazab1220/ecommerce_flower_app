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
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final selectedIndex = state.selectedTabIndex;
        return SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  if (!isSelected) cubit.doIntent(ChangeTabAction(index));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                        color:
                            isSelected
                                ? AppColors.pink
                                : AppColors.white[AppColors.colorCode70],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
