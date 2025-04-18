import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:ecommerce_flower_app/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../view_model/occasion_cubit.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OccasionCubit, OccasionState>(
      builder: (context, state) {
        final productsState = state.productsState;
        final occasionState = state.occasionState;
        final isError = productsState is BaseErrorState;
        if (isError) {
          return Center(child: Text((productsState).errorMessage));
        } else {
          final isLoading =
              productsState is BaseLoadingState ||
              occasionState is BaseLoadingState;
          final products =
              productsState is BaseSuccessState<List<ProductEntity>>
                  ? productsState.data
                  : List.generate(
                    6,
                    (_) => ProductEntity(
                      title:
                          LocaleKeys
                              .NoProductsAvailable.tr(), //assign title to to increase the length of text in skeletonizer
                    ),
                  );
          return products == null && products!.isEmpty
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
