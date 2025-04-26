import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/orders/domain/entity/order_entity.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view/widgets/order_item.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view_model/orders_cubit.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view_model/orders_state.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersCubit>(
      create: (_) => getIt<OrdersCubit>()..doIntent(GetOrdersAction()),
      child: const _OrdersView(),
    );
  }
}

class _OrdersView extends StatelessWidget {
  const _OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersCubit>();

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (ctx, state) {
        return DefaultTabController(
          length: cubit.tabLabels.length,
          initialIndex: state.selectedTabIndex,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('My orders'),
              bottom: _OrdersTabBar(cubit: cubit),
            ),
            body: _OrdersBody(cubit: cubit, state: state),
          ),
        );
      },
    );
  }
}

class _OrdersTabBar extends StatelessWidget implements PreferredSizeWidget {
  final OrdersCubit cubit;

  const _OrdersTabBar({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        cubit.doIntent(ChangeTabAction(index));
      },
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 3, color: AppColors.pink),
        insets: EdgeInsets.symmetric(horizontal: 12),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColors.pink,
      unselectedLabelColor: AppColors.white[AppColors.colorCode70],
      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      tabs: cubit.tabLabels.map((t) => Tab(text: t)).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}

class _OrdersBody extends StatelessWidget {
  final OrdersCubit cubit;
  final OrdersState state;

  const _OrdersBody({required this.cubit, required this.state, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = state.baseState;

    if (base is BaseLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    if (base is BaseErrorState) {
      return _ErrorView(
        message: base.errorMessage,
        onRetry: () => cubit.doIntent(GetOrdersAction()),
      );
    }

    final allOrders = (base as BaseSuccessState<List<OrderEntity>>).data!;
    final status = cubit.statuses[state.selectedTabIndex];
    final display = allOrders.where((o) => o.state == status).toList();
    if (display.isEmpty) {
      return const Center(child: Text('No Orders'));
    }

    // flatten orders → (order, item) pairs
    final flat =
        display
            .expand(
              (order) => order.orderItems.map((item) => MapEntry(order, item)),
            )
            .toList();

    return ListView.builder(
      itemCount: flat.length,
      itemBuilder: (_, i) {
        final entry = flat[i];
        return OrderItem(
          productEntity: entry.value.product,
          orderId: entry.key.orderId,
          orderNumber: entry.key.orderNumber,
        );
      },
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry, super.key});

  @override
  Widget build(BuildContext c) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(message),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
