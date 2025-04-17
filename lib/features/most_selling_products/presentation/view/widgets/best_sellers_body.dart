import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/best_seller_cubit.dart';
import '../../view_model/best_seller_state.dart';
import '../../../../../core/widgets/product_item.dart';

class BestSellersBody extends StatelessWidget {
  const BestSellersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final BestSellerCubit bestSellerCubit = getIt<BestSellerCubit>();
    return BlocProvider(
      create: (context) => bestSellerCubit..doIntent(BestSellerRequestAction()),
      child: BlocBuilder<BestSellerCubit, BestSellerState>(
        builder: (context, state) {
          final bestSellerState = state.baseState;
          final isError = bestSellerState is BaseErrorState;
          if (isError) {
            return Center(child: Text((bestSellerState).errorMessage));
          } else {
            final isLoading = bestSellerState is BaseLoadingState;
            final products =
                bestSellerState is BaseSuccessState<List<ProductEntity>>
                    ? bestSellerState.data
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
      ),
    );
  }
}
