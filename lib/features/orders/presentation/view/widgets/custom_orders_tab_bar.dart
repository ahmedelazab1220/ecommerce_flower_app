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
        return DefaultTabController(
          length: tabs.length,
          initialIndex: state.selectedTabIndex,
          child: TabBar(
            onTap: (index) {
              if (index != state.selectedTabIndex) {
                cubit.doIntent(ChangeTabAction(index));
              }
            },
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.pink,
            unselectedLabelColor: AppColors.white[AppColors.colorCode70],
            indicatorColor: AppColors.pink,
            indicatorWeight: 3,
            tabs: tabs.map((label) => Tab(text: label)).toList(),
          ),
        );
      },
    );
  }
}
