import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../domain/entity/addresses_entity.dart';
import '../../view_model/checkout_cubit.dart';
import '../../view_model/checkout_state.dart';
import 'add_new_btn.dart';
import 'address_item.dart';

class DeliveryAddressesSection extends StatelessWidget {
  const DeliveryAddressesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutCubit>();
    if (viewModel.addresses?.isEmpty ?? true) {
      viewModel.doIntent(GetAddressesAction());
    }

    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (prev, curr) => prev.addressState != curr.addressState,
      builder: (context, state) {
        final isLoading = state.addressState is BaseLoadingState;
        final addresses =
            isLoading
                ? List.generate(3, (_) => AddressesEntity.fake())
                : viewModel.addresses ?? [];

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.DeliveryAddress.tr(),
                style: AppTheme.appTheme.textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Skeletonizer(
                enabled: isLoading,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: addresses.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    return AddressItem(
                      index: index,
                      groupValue: viewModel.selectedAddressIndex,
                      onChanged: (val) {
                        if (val != null) {
                          viewModel.selectAddress(val);
                        }
                      },
                      title: '${address.street}',
                      subtitle: '${address.street}, ${address.city}',
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              const AddNewBtn(),
            ],
          ),
        );
      },
    );
  }
}
