import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view/widgets/orders_error_view.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view/widgets/orders_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view_model/orders_cubit.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view_model/orders_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import 'order_item.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final base = state.baseState;
        if (base is BaseErrorState) {
          return OrdersErrorView(error: base.errorMessage);
        }
        if (base is BaseLoadingState) {
          return OrdersLoadingView();
        }
        final flatItems = cubit.flattenedOrderItems;
        if (flatItems.isEmpty) {
          return Center(child: Text(LocaleKeys.NoOrdersYet.tr()));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
          child: ListView.separated(
            itemCount: flatItems.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (ctx, i) {
              final entry = flatItems[i];
              return OrderItem(
                productEntity: entry.value.product,
                orderId: entry.key.orderId,
                orderNumber: entry.key.orderNumber,
                actionText:
                    entry.key.state == 'inProgress'
                        ? LocaleKeys.TrackOrder.tr()
                        : LocaleKeys.Reorder.tr(),
              );
            },
          ),
        );
      },
    );
  }
}
