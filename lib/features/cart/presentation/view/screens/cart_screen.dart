import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view/widgets/total_price_item.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view_model/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../../../core/utils/shared_models/product_entity.dart';
import '../../../domain/entity/cart_entity.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = getIt<CartCubit>();
    return BlocProvider(
      create: (context) => cartCubit..doIntent(GetCartAction()),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final bool isLoading = state.baseState is BaseLoadingState;
          final bool isError = state.baseState is BaseErrorState;
          final CartEntity? cart =
              state.baseState is BaseSuccessState<CartEntity>
                  ? (state.baseState as BaseSuccessState<CartEntity>).data
                  : null;

          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text(
                    LocaleKeys.Cart.tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  if (cart != null)
                    Text(
                      " (${cart.numOfCartItems} ${LocaleKeys.Items.tr()})",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(color: AppColors.gray),
                    ),
                ],
              ),
            ),
            body:
                isError
                    ? Center(
                      child: Text(
                        (state.baseState as BaseErrorState).errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                    : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Skeletonizer(
                          enabled: isLoading,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics:
                                    isLoading
                                        ? const NeverScrollableScrollPhysics()
                                        : const NeverScrollableScrollPhysics(),
                                itemCount: isLoading ? 2 : cart!.numOfCartItems,
                                itemBuilder: (context, index) {
                                  final product =
                                      isLoading ? null : cart!.cartList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      if (!isLoading && product != null) {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.productDetailsRoute,
                                          arguments: product,
                                        ).then((_) {
                                          cartCubit.doIntent(GetCartAction());
                                        });
                                      }
                                    },
                                    child: CartItem(
                                      cartProductEntity:
                                          product ?? ProductEntity.fake(),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (context, index) =>
                                        const SizedBox(height: 24),
                              ),
                              const SizedBox(height: 20),
                              TotalPriceItem(
                                subtotal: cart?.totalPrice ?? 0,
                                deliveryFee: 0,
                                totalPrice: cart?.totalPriceAfterDiscount ?? 0,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                ),
                                onPressed: isLoading ? null : () {},
                                child: Text(LocaleKeys.Checkout.tr()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
          );
        },
      ),
    );
  }
}
