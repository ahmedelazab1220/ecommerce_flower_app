import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/product_entity.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/product_item.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_cubit.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final productState = state.getProductsState;

        if (productState is BaseLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (productState is BaseSuccessState<List<ProductEntity>>) {
          final products = productState.data;
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
                  return ProductItem(product: products[index]);
                },
              );
        }
        return Center(
          child: Text((productState as BaseErrorState).errorMessage),
        );
      },
    );
  }
}
