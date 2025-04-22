import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/checkout/presentation/view_model/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/theme/app_theme.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/delivery_addresses_section.dart';
import '../widgets/delivery_time_section.dart';
import '../widgets/is_gift_section.dart';
import '../widgets/payment_section.dart';
import '../widgets/total_price_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viwModel = getIt<CheckoutCubit>();
    return Scaffold(
      backgroundColor: AppColors.lightPink,
      appBar: AppBar(
        title: Text(
          LocaleKeys.Checkout.tr(),
          style: AppTheme.appTheme.textTheme.titleLarge,
        ),
      ),
      body: BlocProvider(
        create: (_) => viwModel,
        child: const SingleChildScrollView(
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
      ),
    );
  }
}
