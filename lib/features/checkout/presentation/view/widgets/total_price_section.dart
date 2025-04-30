import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/shared_models/address_entity.dart';
import '../../../domain/entity/add_order_request_entity.dart';
import '../../view_model/checkout_cubit.dart';
import '../../view_model/checkout_state.dart';
import 'prices_section.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutCubit>();
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const PricesSection(),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    final request = AddOrderRequestEntity(
                      addressEntity: AddressEntity(
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
              ],
            ),
          ),
        );
      },
    );
  }
}
