import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/checkout_cubit.dart';
import '../../view_model/checkout_state.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutCubit>();
    viewModel.doIntent(GetOrderDetailsAction());

    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen:
          (previous, current) =>
              previous.orderDetailsState != current.orderDetailsState,
      builder: (context, state) {
        final isLoading = state.orderDetailsState is BaseLoadingState;
        final cartData = viewModel.cartData;

        return Skeletonizer(
          enabled: isLoading,
          child: Container(
            padding: const EdgeInsets.only(
              top: 24,
              right: 16,
              left: 16,
              bottom: 64,
            ),
            color: AppColors.white,
            child: Column(
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
                      style: AppTheme.appTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${cartData?.totalPriceAfterDiscount ?? 0}",
                      style: AppTheme.appTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(LocaleKeys.PlaceOrder.tr()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
