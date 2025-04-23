import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/checkout/presentation/view/widgets/prices_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../data/model/request/add_order_request_dto.dart';
import '../../../data/model/request/shipping_address.dart';
import '../../view_model/checkout_cubit.dart';
import '../../view_model/checkout_state.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({Key? key}) : super(key: key);

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
                const PricesSection(),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final request = AddOrderRequestDto(
                        shippingAddress: ShippingAddress(
                          street:
                              viewModel
                                  .addresses?[viewModel.selectedAddressIndex]
                                  .street,
                          phone:
                              viewModel
                                  .addresses?[viewModel.selectedAddressIndex]
                                  .phone,
                          city:
                              viewModel
                                  .addresses?[viewModel.selectedAddressIndex]
                                  .city,
                          lat:
                              viewModel
                                  .addresses?[viewModel.selectedAddressIndex]
                                  .lat,
                          long:
                              viewModel
                                  .addresses?[viewModel.selectedAddressIndex]
                                  .long,
                        ),
                      );
                      if (viewModel.selectedPaymentIndex == 0) {
                        viewModel.doIntent(AddCacheOrderAction(request));
                      } else {
                        viewModel.doIntent(AddCreditOrderAction(request));
                      }
                    },
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
