import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../data/model/response/cash_order/add_cache_order_response_dto.dart';
import '../../../data/model/response/credit_order/add_credit_order_response_dto.dart';
import '../../view_model/checkout_cubit.dart';
import '../../view_model/checkout_state.dart';
import '../widgets/delivery_addresses_section.dart';
import '../widgets/delivery_time_section.dart';
import '../widgets/is_gift_section.dart';
import '../widgets/payment_section.dart';
import '../widgets/payment_web_view_screen.dart';
import '../widgets/total_price_section.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final viewModel = getIt<CheckoutCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.doIntent(GetAddressesAction());
      viewModel.doIntent(GetOrderDetailsAction());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckoutCubit>(
      create: (_) => viewModel,
      child: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) async {
          if (state.orderState is BaseSuccessState<AddCacheOrderResponseDto> &&
              viewModel.selectedPaymentIndex == 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.trackOrderSuccessRoute,
              (route) => route.isFirst,
            );
          }
          if (state.orderState is BaseSuccessState<AddCreditOrderResponseDto> &&
              viewModel.selectedPaymentIndex == 1) {
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
            if (result == true && context.mounted) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.trackOrderSuccessRoute,
              );
            } else if (context.mounted) {
              await AppDialogs.showFailureDialog(
                context,
                message: LocaleKeys.PaymentFailedPleaseTryAgain.tr(),
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightPink,
            appBar: AppBar(title: Text(LocaleKeys.Checkout.tr())),
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
