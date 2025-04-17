import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../view_model/occasion_cubit.dart';

class CustomOccasionTabBar extends StatelessWidget {
  final List<Tab> tabs;

  const CustomOccasionTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OccasionCubit, OccasionState>(
      builder: (context, state) {
        final selectedIndex = state.selectedTabIndex;
        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  if (!isSelected) {
                    context.read<OccasionCubit>().doIntent(
                      ChangeOccasionTabAction(index),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tabs[index].text ?? '',
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
                          height: 4,
                          width: 67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
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
            },
          ),
        );
      },
    );
  }
}
