import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view/widgets/total_price_item.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view_model/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_lotties.dart';
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
                    : isLoading
                    ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Skeletonizer(
                          enabled: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                itemBuilder:
                                    (context, index) => CartItem(
                                      cartProductEntity: ProductEntity.fake(),
                                    ),
                                separatorBuilder:
                                    (_, __) => const SizedBox(height: 24),
                              ),
                              const SizedBox(height: 20),
                              const TotalPriceItem(
                                subtotal: 0,
                                deliveryFee: 0,
                                totalPrice: 0,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: null,
                                child: Text(LocaleKeys.Checkout.tr()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    : (cart == null || cart.numOfCartItems == 0)
                    ? Center(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                AppLotties.cartEmpty,
                                width: 300,
                                height: 300,
                              ),
                              const SizedBox(height: 32),
                              Text(
                                LocaleKeys.YourCartIsEmpty.tr(),
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  fontSize: 20,
                                  color: AppColors.pink,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                LocaleKeys
                                    .ExploreItemsAndAddThemToYourCart.tr(),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.pink,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cart.numOfCartItems,
                              itemBuilder: (context, index) {
                                final product = cart.cartList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.productDetailsRoute,
                                      arguments: product,
                                    ).then((_) {
                                      cartCubit.doIntent(GetCartAction());
                                    });
                                  },
                                  child: CartItem(cartProductEntity: product),
                                );
                              },
                              separatorBuilder:
                                  (_, __) => const SizedBox(height: 24),
                            ),
                            const SizedBox(height: 20),
                            TotalPriceItem(
                              subtotal: cart.totalPrice,
                              deliveryFee: 0,
                              totalPrice: cart.totalPriceAfterDiscount,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(vertical: 14),
                                ),
                              ),
                              onPressed: () {
                                if (cart.numOfCartItems > 0) {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.checkoutRoute,
                                  ).then((_) {
                                    cartCubit.doIntent(GetCartAction());
                                  });
                                }
                              },
                              child: Text(LocaleKeys.Checkout.tr()),
                            ),
                          ],
                        ),
                      ),
                    ),
          );
        },
      ),
    );
  }
}
