import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/cart/presentation/view/widgets/total_price_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/shared_models/product_entity.dart';
import 'cart_item.dart';

class CartLoadingView extends StatelessWidget {
  const CartLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  (_, __) => CartItem(cartProductEntity: ProductEntity.fake()),
              separatorBuilder: (_, __) => const SizedBox(height: 24),
            ),
            const SizedBox(height: 20),
            const TotalPriceItem(subtotal: 0, deliveryFee: 0, totalPrice: 0),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,
              child: Text(LocaleKeys.Checkout.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
