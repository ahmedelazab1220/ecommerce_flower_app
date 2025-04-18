import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        ),
        body: BlocBuilder<OccasionCubit, OccasionState>(
          builder: (context, state) {
            final occasionState = state.occasionState;
            final isError = occasionState is BaseErrorState;
            if (isError) {
              return Center(child: Text((occasionState).errorMessage));
            } else {
              final isLoading = occasionState is BaseLoadingState;
              final tabs =
                  occasionState is BaseSuccessState<List<Tab>>
                      ? occasionState.data
                      : List.generate(
                        5,
                        (i) => Tab(text: LocaleKeys.Occasion.tr()),
                      );

              return tabs == null && tabs!.isEmpty
                  ? const Center(child: Text(LocaleKeys.NoProductsAvailable))
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Skeletonizer(
                      enabled: isLoading,
                      child: Column(
                        children: [
                          CustomOccasionTabBar(tabs: tabs),
                          const Expanded(child: ProductView()),
                        ],
                      ),
                    ),
                  );
            }
          },
        ),
      ),
    );
  }
}
