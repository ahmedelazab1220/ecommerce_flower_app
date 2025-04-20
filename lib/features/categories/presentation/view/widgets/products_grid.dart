import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:ecommerce_flower_app/core/widgets/product_item.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_cubit.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              ? Center(child: Text(LocaleKeys.NoProductsAvailable.tr()))
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
                          arguments: products[index],
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
