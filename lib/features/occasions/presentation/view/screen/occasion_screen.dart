import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/occasion_cubit.dart';
import '../widgets/product_view.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<OccasionCubit>();
    return BlocProvider(
      create: (_) => viewModel..doIntent(OccasionRequestAction()),
      child: BlocBuilder<OccasionCubit, OccasionState>(
        builder: (context, state) {
          final viewModel = context.read<OccasionCubit>();
          final tabs = viewModel.myTabs;
          if (tabs == null || tabs.isEmpty) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return DefaultTabController(
            length: tabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: ListTile(
                  title: Text(
                    LocaleKeys.Occasion.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    LocaleKeys.BloomWithOurExquisiteBestSellers.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: AppColors.pink,
                  labelColor: AppColors.pink,
                  unselectedLabelColor: AppColors.lightGray,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerHeight: 2,
                  tabs: tabs.map((tab) => Tab(text: tab.text)).toList(),
                ),
              ),
              body: TabBarView(
                children:
                    tabs.map((tab) {
                      final index = tabs.indexOf(tab);
                      final occasionId = viewModel.occasions?[index].id;
                      return ProductView(occasionId: occasionId ?? "");
                    }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
