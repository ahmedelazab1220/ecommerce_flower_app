import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/presentation/view/widgets/product_item.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/presentation/view_model/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/domain/entity/best_seller_product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/best_seller_state.dart';

class BestSellers extends StatelessWidget {
  final BestSellerCubit bestSellerCubit = getIt<BestSellerCubit>();

  BestSellers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            LocaleKeys.BestSeller.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            LocaleKeys.BloomWithOurExquisiteBestSellers.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BlocProvider(
          create:
              (context) => bestSellerCubit..doIntent(BestSellerRequestAction()),
          child: BlocBuilder<BestSellerCubit, BestSellerState>(
            builder: (context, state) {
              if (state.baseState is BaseLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state.baseState
                  is BaseSuccessState<List<BestSellerProductEntity>>) {
                final products =
                    (state.baseState
                            as BaseSuccessState<List<BestSellerProductEntity>>)
                        .data;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17,
                    mainAxisSpacing: 17,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductItem(productEntity: product);
                  },
                );
              }
              return Center(
                child: Text(
                  (state.baseState as BaseErrorState).errorMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
