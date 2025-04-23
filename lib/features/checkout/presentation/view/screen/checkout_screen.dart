import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/checkout/presentation/view_model/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/theme/app_theme.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../../data/model/response/cash_order/add_cache_order_response_dto.dart';
import '../../../data/model/response/credit_order/add_credit_order_response_dto.dart';
import '../../view_model/checkout_state.dart';
import '../widgets/delivery_addresses_section.dart';
import '../widgets/delivery_time_section.dart';
import '../widgets/is_gift_section.dart';
import '../widgets/payment_section.dart';
import '../widgets/payment_web_view_screen.dart';
import '../widgets/total_price_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<CheckoutCubit>();
    return BlocProvider<CheckoutCubit>(
      create: (_) => viewModel,
      child: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) async {
          final cubit = context.read<CheckoutCubit>();
          if (state.orderState is BaseSuccessState<AddCacheOrderResponseDto> &&
              cubit.selectedPaymentIndex == 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.trackOrderSuccessRoute,
              (route) => route.isFirst,
            );
          }
          if (state.orderState is BaseSuccessState<AddCreditOrderResponseDto> &&
              cubit.selectedPaymentIndex == 1) {
            final response =
                (state.orderState
                        as BaseSuccessState<AddCreditOrderResponseDto>)
                    .data;
            final url = response?.session?.url;
            final result = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (_) => PaymentWebViewScreen(initialUrl: url ?? ""),
              ),
            );
            if (result == true) {
              Navigator.pushReplacementNamed(
                // ignore: use_build_context_synchronously
                context,
                AppRoutes.trackOrderSuccessRoute,
              );
            } else {
              await AppDialogs.showFailureDialog(
                // ignore: use_build_context_synchronously
                context,
                message: LocaleKeys.PaymentFailedPleaseTryAgain.tr(),
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightPink,
            appBar: AppBar(
              title: Text(
                LocaleKeys.Checkout.tr(),
                style: AppTheme.appTheme.textTheme.titleLarge,
              ),
            ),
            body: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeliveryTimeSection(),
                  SizedBox(height: 24),
                  DeliveryAddressesSection(),
                  SizedBox(height: 24),
                  PaymentSection(),
                  SizedBox(height: 24),
                  IsGiftSection(),
                  SizedBox(height: 24),
                  TotalPriceSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
