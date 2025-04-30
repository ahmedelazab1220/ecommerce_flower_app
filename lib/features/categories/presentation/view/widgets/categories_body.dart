import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../domain/entities/category_entity.dart';
import '../../view_model/categories_cubit.dart';
import '../../view_model/categories_state.dart';
import 'custom_tab_bar.dart';
import 'products_grid.dart';
import 'search_filter_bar.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          final categoriesState = state.getCategoriesState;
          final isError = categoriesState is BaseErrorState;
          if (isError) {
            return Center(child: Text((categoriesState).errorMessage));
          } else {
            final isLoading = categoriesState is BaseLoadingState;
            final categories =
                categoriesState is BaseSuccessState<List<CategoryEntity>>
                    ? categoriesState.data
                    : List.generate(
                      6,
                      (i) => CategoryEntity(name: LocaleKeys.Flowers.tr()),
                    );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchFilterBar(),
                const SizedBox(height: 16),
                Skeletonizer(
                  enabled: isLoading,
                  child: CustomTabBar(categories: categories ?? []),
                ),
                const SizedBox(height: 16),
                const Expanded(child: ProductsGrid()),
              ],
            );
          }
        },
      ),
    );
  }
}
