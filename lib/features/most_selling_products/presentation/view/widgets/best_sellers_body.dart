import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
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
          if (state.baseState is BaseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.baseState is BaseSuccessState<List<ProductEntity>>) {
            final products =
                (state.baseState as BaseSuccessState<List<ProductEntity>>).data;
            if (products == null || products.isEmpty) {
              return Center(
                child: Text(
                  LocaleKeys.NoProductsAvailable.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                childAspectRatio: 0.845,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItem(product: product);
              },
            );
          } else if (state.baseState is BaseErrorState) {
            AppDialogs.showFailureDialog(
              context,
              message: (state.baseState as BaseErrorState).errorMessage,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
