import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/checkout_cubit.dart';

class PricesSection extends StatelessWidget {
  const PricesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutCubit>();
    final cartData = viewModel.cartData;
    return Column(
      children: [
        Row(
          children: [
            Text(LocaleKeys.SubTotal.tr()),
            const Spacer(),
            Text("\$${cartData?.totalPrice ?? 0}"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(LocaleKeys.DeliveryFee.tr()),
            const Spacer(),
            const Text("\$0"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(LocaleKeys.Discount.tr()),
            const Spacer(),
            Text("${cartData?.discount ?? 0}%"),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
        Row(
          children: [
            Text(
              LocaleKeys.Total.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              "\$${cartData?.totalPriceAfterDiscount ?? 0}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
