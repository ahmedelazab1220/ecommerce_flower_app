import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/custom_tab_bar.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/products_grid.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/search_filter_bar.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_cubit.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                          (i) => CategoryEntity(
                            name: LocaleKeys.Flowers.tr(),
                          ), //assign name to to increase the length of text in skeletonizer
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
        ),
      ),
    );
  }
}
