import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/occasion_cubit.dart';
import '../widgets/custom_occasion_tab_bar.dart';
import '../widgets/product_view.dart';

class OccasionScreen extends StatefulWidget {
  final int? occasionIndex;
  const OccasionScreen({super.key, this.occasionIndex});

  @override
  State<OccasionScreen> createState() => _OccasionScreenState();
}

class _OccasionScreenState extends State<OccasionScreen> {
  final viewModel = getIt<OccasionCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.doIntent(OccasionRequestAction(index: widget.occasionIndex));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<OccasionCubit, OccasionState>(
        builder: (context, state) {
          final cubit = context.read<OccasionCubit>();
          final tabs = cubit.myTabs;
          final selectedTabIndex = state.selectedTabIndex;

          if (tabs == null || tabs.isEmpty) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final occasionId = cubit.occasions?[selectedTabIndex].id ?? "";

          return Scaffold(
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
            ),
            body: Column(
              children: [
                CustomOccasionTabBar(tabs: tabs),
                Expanded(child: ProductView(occasionId: occasionId)),
              ],
            ),
          );
        },
      ),
    );
  }
}
