import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../../../core/utils/shared_models/product_entity.dart';
import '../../../../../core/widgets/product_item.dart';
import '../../view_model/categories_cubit.dart';
import '../../view_model/categories_state.dart';
import 'handle_empty_product_items.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CategoriesCubit>();
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final productState = state.getProductsState;
        final categoriesState = state.getCategoriesState;
        final isError = productState is BaseErrorState;
        if (isError) {
          return Center(child: Text((productState).errorMessage));
        } else {
          final isLoading =
              productState is BaseLoadingState ||
              categoriesState is BaseLoadingState;
          final products =
              productState is BaseSuccessState<List<ProductEntity>>
                  ? productState.data
                  : List.generate(
                    6,
                    (_) => ProductEntity(
                      title: LocaleKeys.NoProductsAvailable.tr(),
                    ),
                  );
          return products!.isEmpty
              ? const HandleEmptyProductItems()
              : GridView.builder(
                controller: viewModel.scrollController,
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
