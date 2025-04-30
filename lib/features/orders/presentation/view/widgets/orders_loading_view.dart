import 'package:ecommerce_flower_app/features/orders/presentation/view/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/shared_models/product_entity.dart';

class OrdersLoadingView extends StatelessWidget {
  const OrdersLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
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
                  (_, __) => OrderItem(
                    productEntity: ProductEntity.fake(),
                    orderId: '0',
                    orderNumber: '0',
                    actionText: '0',
                  ),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
          ],
        ),
      ),
    );
  }
}
