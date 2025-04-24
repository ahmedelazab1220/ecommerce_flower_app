import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/search/presentation/view/widgets/search_field.dart';
import 'package:ecommerce_flower_app/features/search/presentation/view_model/search_cubit.dart';
import 'package:ecommerce_flower_app/features/search/presentation/view_model/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../../../core/utils/shared_models/product_entity.dart';
import '../../../../../core/widgets/product_item.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final searchState = state.baseState;
        if (searchState is BaseInitialState) {
          return Center(
            child: Text(
              LocaleKeys.SearchForAnyProductYouWant.tr(),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.pink),
            ),
          );
        }
        final isError = searchState is BaseErrorState;
        if (isError) {
          return Center(child: Text((searchState).errorMessage));
        } else {
          final isLoading = searchState is BaseLoadingState;
          final products =
              searchState is BaseSuccessState<List<ProductEntity>>
                  ? searchState.data
                  : List.generate(
                    6,
                    (_) => ProductEntity(
                      title:
                          LocaleKeys
                              .NoProductsAvailable.tr(), //assign title to to increase the length of text in skeletonizer
                    ),
                  );
          return products!.isEmpty
              ? Center(child: Text(LocaleKeys.NoProductsAvailable.tr()))
              : GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 17,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    enabled: isLoading,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.productDetailsRoute,
                          arguments: {'productEntity': products[index]},
                        );
                      },
                      child: ProductItem(product: products[index]),
                    ),
                  );
                },
              );
        }
      },
    );
  }
}
