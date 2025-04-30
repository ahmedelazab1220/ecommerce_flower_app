import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../../domain/entity/best_seller_entity.dart';
import '../../../domain/entity/category_entity.dart';
import '../../../domain/entity/occasion_entity.dart';
import '../../view_model/home_cubit.dart';
import 'best_seller_list_items.dart';
import 'category_list_items.dart';
import 'home_app_bar.dart';
import 'occasion_list_items.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<BestSellerEntity>? bestSellers = [];
        List<CategoryEntity>? categories = [];
        List<OccasionEntity>? occasions = [];
        if (state.bestSellers is BaseSuccessState) {
          bestSellers = (state.bestSellers as BaseSuccessState).data;
        }
        if (state.categories is BaseSuccessState) {
          categories = (state.categories as BaseSuccessState).data;
        }
        if (state.occasions is BaseSuccessState) {
          occasions = (state.occasions as BaseSuccessState).data;
        }
        return CustomScrollView(
          controller: viewModel.scrollController,
          slivers: [
            const HomeAppBar(),
            CategoryListItems(categories: categories ?? []),
            BestSellerListItems(bestSellers: bestSellers ?? []),
            OccasionListItems(occasions: occasions ?? []),
          ],
        );
      },
    );
  }
}
