import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view/widgets/total_price_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../domain/entity/cart_entity.dart';
import '../../view_model/cart_cubit.dart';
import '../../view_model/cart_state.dart';
import 'cart_item.dart';

class CartContentView extends StatelessWidget {
  final CartEntity cart;
  final CartCubit cartCubit;

  const CartContentView({
    super.key,
    required this.cart,
    required this.cartCubit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  ).then((_) => cartCubit.doIntent(GetCartAction()));
                },
                child: CartItem(cartProductEntity: product),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 24),
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
                ).then((_) => cartCubit.doIntent(GetCartAction()));
              }
            },
            child: Text(LocaleKeys.Checkout.tr()),
          ),
        ],
      ),
    );
  }
}
