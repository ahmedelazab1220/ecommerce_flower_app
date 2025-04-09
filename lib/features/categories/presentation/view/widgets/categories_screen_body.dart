import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/custom_tab_bar.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/products_grid.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/search_filter_bar.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_cubit.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

              if (categoriesState is BaseLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (categoriesState
                  is BaseSuccessState<List<CategoryEntity>>) {
                final categories = categoriesState.data;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchFilterBar(),
                    const SizedBox(height: 16),
                    CustomTabBar(categories: categories!),
                    const SizedBox(height: 16),
                    const Expanded(child: ProductsGrid()),
                  ],
                );
              }

              return Center(
                child: Text((categoriesState as BaseErrorState).errorMessage),
              );
            },
          ),
        ),
      ),
    );
  }
}
