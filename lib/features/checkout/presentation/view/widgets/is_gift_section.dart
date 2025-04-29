import 'package:animated_visibility/animated_visibility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/checkout_cubit.dart';
import '../../view_model/checkout_state.dart';
import 'is_gift_form.dart';

class IsGiftSection extends StatelessWidget {
  const IsGiftSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutCubit>();
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen:
          (prev, curr) =>
              (prev.paymentState != curr.paymentState ||
                  prev.isGift != curr.isGift),
      builder: (context, state) {
        return AnimatedVisibility(
          visible: viewModel.selectedPaymentIndex == 1,
          enter: expandVertically(alignment: -1),
          exit: shrinkVertically(alignment: -1),
          child: Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  onTap: () {
                    viewModel.toggleGift(!state.isGift!);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.zero,
                  leading: Switch(
                    value: state.isGift!,
                    onChanged: (val) => viewModel.toggleGift(val),
                    activeColor: AppColors.pink,
                    activeTrackColor: AppColors.pink[AppColors.colorCode40],
                    inactiveThumbColor: AppColors.white,
                    inactiveTrackColor: AppColors.black.withAlpha(5),
                    padding: const EdgeInsets.all(1.0),
                    trackOutlineColor: WidgetStateProperty.all(
                      AppColors.pink.withAlpha(1),
                    ),
                  ),
                  title: Text(
                    LocaleKeys.ItIsAGift.tr(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                AnimatedVisibility(
                  visible: state.isGift!,
                  enter: expandVertically(alignment: -1),
                  exit: shrinkVertically(alignment: -1),
                  child: const IsGiftForm(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
