import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view_model/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../../domain/entity/cart_entity.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_content_view.dart';
import '../widgets/cart_empty_view.dart';
import '../widgets/cart_error_view.dart';
import '../widgets/cart_view.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = getIt<CartCubit>();
    return BlocProvider(
      create: (_) => cartCubit..doIntent(GetCartAction()),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final bool isLoading = state.baseState is BaseLoadingState;
          final bool isError = state.baseState is BaseErrorState;
          final cart =
              state.baseState is BaseSuccessState<CartEntity>
                  ? (state.baseState as BaseSuccessState<CartEntity>).data
                  : null;

          return Scaffold(
            appBar: CartAppBar(cart: cart),
            body:
                isError
                    ? CartErrorView(
                      error: (state.baseState as BaseErrorState).errorMessage,
                    )
                    : isLoading
                    ? const CartView()
                    : (cart == null || cart.numOfCartItems == 0)
                    ? const CartEmptyView()
                    : CartContentView(cart: cart, cartCubit: cartCubit),
          );
        },
      ),
    );
  }
}
