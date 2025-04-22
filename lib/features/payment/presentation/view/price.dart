import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/l10n/locale_keys.g.dart';

class PriceSummary extends StatelessWidget {
  final double subTotal;
  final double deliveryFee;

  const PriceSummary({
    super.key,
    required this.subTotal,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.SubTotal.tr()),
            Text('${subTotal.toStringAsFixed(2)}\$'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.DeliveryFee.tr()),
            Text('${deliveryFee.toStringAsFixed(2)}\$'),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.Total.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${(subTotal + deliveryFee).toStringAsFixed(2)}\$',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
