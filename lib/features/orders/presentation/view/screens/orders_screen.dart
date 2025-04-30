import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view_model/orders_cubit.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/orders_state.dart';
import '../widgets/custom_orders_tab_bar.dart';
import '../widgets/orders_body.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final OrdersCubit ordersCubit = getIt<OrdersCubit>();

  @override
  void initState() {
    ordersCubit.doIntent(GetOrdersAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersCubit>(
      create: (_) => ordersCubit,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.MyOrders.tr())),
        body: BlocListener<OrdersCubit, OrdersState>(
          listener: (context, state) {
            if (state.cartState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            }
            if (state.cartState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showSuccessDialog(
                context,
                message: LocaleKeys.ProductAddedToCartSuccessfully.tr(),
                description: LocaleKeys.DoneTheItemIsNowInYourShoppingCart.tr(),
                firstButtonText: LocaleKeys.Ok.tr(),
              );
            }
            if (state.cartState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: LocaleKeys.AddedToCartFailed.tr(),
                description: (state.cartState as BaseErrorState).errorMessage,
                firstButtonText: LocaleKeys.Ok.tr(),
              );
            }
          },
          child: const Column(
            children: [CustomOrdersTabBar(), Expanded(child: OrdersBody())],
          ),
        ),
      ),
    );
  }
}
