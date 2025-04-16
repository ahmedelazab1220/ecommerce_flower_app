import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view/widgets/total_price_item.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view_model/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../../domain/entity/cart_entity.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = getIt<CartCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => cartCubit..doIntent(GetCartAction()),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state.baseState is BaseLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.baseState is BaseErrorState) {
                return Center(
                  child: Text(
                    (state.baseState as BaseErrorState).errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (state.baseState is BaseSuccessState<CartEntity>) {
                final cart =
                    (state.baseState as BaseSuccessState<CartEntity>).data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: cart!.numOfCartItems,
                      itemBuilder: (context, index) {
                        final product = cart.cartList[index];
                        return CartItem(cartProductEntity: product);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 24);
                      },
                    ),
                    const SizedBox(height: 20),
                    TotalPriceItem(
                      subtotal: cart.totalPrice,
                      deliveryFee: 10,
                      totalPrice: cart.totalPriceAfterDiscount,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
