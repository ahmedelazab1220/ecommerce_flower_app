import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';

class TotalPriceItem extends StatelessWidget {
  final int subtotal;
  final int deliveryFee;
  final int totalPrice;

  const TotalPriceItem({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(LocaleKeys.SubTotal.tr()),
            const Spacer(),
            Text("\$$subtotal"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(LocaleKeys.DeliveryFee.tr()),
            const Spacer(),
            Text("\$$deliveryFee"),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
        Row(
          children: [
            Text(LocaleKeys.Total.tr()),
            const Spacer(),
            Text("\$${totalPrice + deliveryFee}"),
          ],
        ),
      ],
    );
  }
}
